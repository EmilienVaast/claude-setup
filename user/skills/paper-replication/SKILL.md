---
name: paper-replication
description: Replicate the tables or figures of an academic finance paper (e.g. Rockafellar-Uryasev CVaR) in Python or R, with a side-by-side comparison of reported vs replicated numbers. Use when asked to replicate, reproduce or re-implement a paper's results.
---

# Paper replication workflow

1. **Pin the target.** Identify the exact tables/figures to replicate. Extract the paper's numbers into `reports/target_tables.csv` before writing any model code.
2. **Extract the method.** From the paper (Zotero/vault first), write `reports/method.md`: notation, equations (LaTeX), data, parameters, sample period, and every assumption the paper leaves implicit. List ambiguities explicitly.
3. **Data.** Delegate acquisition to the `data-wrangler` subagent if data is needed. Simulated data: fixed seed, document the generator.
4. **Implement** in `src/` as small, tested functions (one per equation block). Language: R if the course requires it, otherwise Python with uv.
5. **Compare.** Produce `reports/comparison.csv` and a table: paper value | ours | abs diff | rel diff. Agreed tolerance by default: 1% relative or within 2 MC standard errors.
6. **Explain gaps.** For each gap above tolerance, list candidate causes (sample, optimiser, rounding, typo in paper) and test the most likely one.
7. **Review.** Run the `quant-reviewer` subagent before writing the report.
8. **Report.** French if it is an HEC deliverable. Include the method, results table, gap analysis, and how to run the code.
