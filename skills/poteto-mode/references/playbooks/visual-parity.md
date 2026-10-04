# Visual parity

Establish the approved baseline and relevant states, viewports, scale factors, fonts, and rendering environment before changing UI. Preserve the baseline. Use the project's existing visual regression harness or available browser driver; native UI coverage unavailable is an explicit limitation.

Compare captures under matching conditions with an image-diff tool. Choose the acceptance tolerance from the task or established harness, not after seeing the result. Pixel-exact requests require zero unexplained delta. Investigate differences rather than altering the baseline or hiding affected regions to pass.

Migrate one coherent component at a time; shared primitives have one owner. Authorized parallel work uses separate outputs and coordinated contracts. Return states exercised, baseline and candidate artifacts, diff results, and unverified environments. Use [Opening a PR](opening-a-pr.md) when delivery is requested.
