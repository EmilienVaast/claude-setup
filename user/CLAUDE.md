# Global context — Émilien (copy to ~/.claude/CLAUDE.md)

## Who I am
- Graduate student, HEC Montréal (quant finance, management theory, institutional economics).
- Portfolio manager / lead, Fonds BNI – HEC Montréal.
- Interests: derivatives, risk (VaR/CVaR), fixed income, power & energy markets, stochastic calculus.

## Language
- French for HEC deliverables (rapports, devoirs, présentations). English for code, comments, commit messages and research notes.
- Use proper French typography in French text (espace insécable avant « : ; ? ! », guillemets « »).

## Python
- Package manager: **uv** (never pip). New projects: `uv init`, deps via `uv add`, run via `uv run`.
- Lint/format: **Ruff** (`uv run ruff check --fix`, `uv run ruff format`). A hook formats every edited .py file.
- Preferred stack: numpy, pandas/polars, scipy, statsmodels, matplotlib; QuantLib for pricing; JAX when autodiff helps.
- Type hints on public functions. Vectorize; no Python loops over time series unless path-dependent.

## R
- Use for coursework when the course requires it (e.g. CNIF assignments). Prefer base R + data.table/tidyverse as the course does; scripts must run top-to-bottom with `set.seed()`.

## Quant hygiene (always)
- State units, day-count, compounding and annualisation explicitly.
- Fix random seeds; report number of simulations and standard errors for Monte Carlo results.
- No look-ahead: any backtest must use information available at t only. Flag survivorship bias in equity samples.
- When replicating a paper, put the paper's reported numbers next to ours and explain any gap.
- Never fabricate data, tickers, or citations. If a series is unavailable, say so.

## Data sources
- Free: FRED (MCP server), Banque du Canada Valet API, yfinance, EIA, ISO/RTO public data.
- WRDS (CRSP, Compustat, OptionMetrics) via the `wrds` Python package — credentials live in ~/.pgpass, never in code.
- Bloomberg/Refinitiv only on the HEC lab terminals: export to CSV/parquet into `data/raw/`, then work here.

## Project layout convention
data/raw (immutable) · data/processed · src/ · notebooks/ (exploration only) · reports/ · tests/

## Knowledge base
- Papers in Zotero; notes in the Markdown vault at `~/vault` (Obsidian-style, [[wikilinks]], YAML front matter with `citekey`).
- When I ask about a paper, check Zotero/vault first before the web.
