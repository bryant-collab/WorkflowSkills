"""Append a decision observed now to a UTF-8 TSV; standard library only."""

import argparse
from datetime import datetime, timezone
import os
from pathlib import Path
import sys

SCHEMA = ("ts", "phase", "decision", "why", "evidence", "result")
HEADER = "\t".join(SCHEMA) + "\n"


def clean_cell(value):
    value = value.replace("\t", " ").replace("\r", " ").replace("\n", " ")
    if "\x00" in value:
        raise ValueError("NUL is not allowed in TSV cells")
    if value.lstrip().startswith(("=", "+", "-", "@")):
        value = "'" + value
    return value


def validate_log(content):
    if not content:
        return
    if not content.endswith("\n"):
        raise ValueError("existing log has an incomplete final line")
    lines = content.splitlines()
    if not lines or lines[0] != HEADER.rstrip("\n"):
        raise ValueError("existing log does not use the ts/phase/decision/why/evidence/result schema")
    for number, line in enumerate(lines[1:], 2):
        cells = line.split("\t")
        if len(cells) != len(SCHEMA):
            raise ValueError(f"existing log row {number} has the wrong column count")
        try:
            timestamp = datetime.fromisoformat(cells[0].replace("Z", "+00:00"))
        except ValueError as exc:
            raise ValueError(f"existing log row {number} has an invalid timestamp") from exc
        if not cells[0].endswith("Z") or timestamp.utcoffset() != timezone.utc.utcoffset(timestamp):
            raise ValueError(f"existing log row {number} must have a UTC timestamp ending in Z")
        if any("\x00" in cell or cell.lstrip().startswith(("=", "+", "-", "@")) for cell in cells[1:]):
            raise ValueError(f"existing log row {number} contains an unsafe cell")


def append_decision(path, phase, decision, why, evidence, result):
    """Use one owner per log. An existing lock fails without deleting it."""
    path = Path(path)
    cells = [clean_cell(value) for value in (phase, decision, why, evidence, result)]
    path.parent.mkdir(parents=True, exist_ok=True)
    lock = path.with_name(path.name + ".lock")
    descriptor = os.open(lock, os.O_CREAT | os.O_EXCL | os.O_WRONLY)
    try:
        os.close(descriptor)
        content = path.read_text(encoding="utf-8") if path.exists() else ""
        validate_log(content)
        timestamp = datetime.now(timezone.utc).isoformat(timespec="microseconds").replace("+00:00", "Z")
        row = "\t".join([timestamp, *cells]) + "\n"
        with path.open("a", encoding="utf-8", newline="\n") as stream:
            stream.write((HEADER if not content else "") + row)
        return timestamp
    finally:
        lock.unlink()


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("logfile", type=Path)
    for name in SCHEMA[1:]:
        parser.add_argument(name)
    args = parser.parse_args(argv)
    try:
        timestamp = append_decision(args.logfile, args.phase, args.decision, args.why, args.evidence, args.result)
    except (OSError, ValueError, UnicodeError) as exc:
        print(f"decision log: {exc}", file=sys.stderr)
        return 1
    print(timestamp)
    return 0


if __name__ == "__main__":
    sys.exit(main())
