---
name: market-review
description: Run the weekly/monthly cross-asset market review for Fonds BNI — rates curve (level/slope/curvature), breakevens, credit spreads, equities, FX, commodities and Canadian specifics — and produce a one-page brief with charts. Use for "market review", "revue de marché", "weekly brief".
disable-model-invocation: true
---

# Market review

Produce `reports/market_review_<YYYY-MM-DD>.md` (+ charts in `reports/fig/`).

## Data (FRED MCP + Banque du Canada Valet + yfinance)
- **US rates:** DGS3MO, DGS2, DGS5, DGS10, DGS30. Level = 10y, slope = 10y–2y, curvature = 2·5y − 2y − 10y.
- **Inflation expectations:** T5YIE, T10YIE, T5YIFR.
- **Credit:** BAMLC0A0CM (IG OAS), BAMLH0A0HYM2 (HY OAS).
- **Canada:** GoC 2y/10y benchmark yields and the policy rate from the BoC Valet API; USD/CAD.
- **Equity / vol / commodities:** S&P 500, S&P/TSX, VIX, WTI, natural gas, gold (yfinance).

## Output
1. Five-line headline: what moved, by how much (in bp or %), versus 1w / 1m / 3m.
2. Table of changes with z-scores against a 1-year window.
3. Three charts max: curve today vs 1m ago, credit spreads, one chart of the week's main story.
4. "Implications for the portfolio": link moves to current Fonds BNI positions if a holdings file is present in `data/raw/fund/`; otherwise leave a placeholder and say so.
5. Calendar for next week (central banks, CPI, jobs, auctions) — search the web and cite.

Language: French if the brief is for the Fund committee, else English. Always cite data series ids and the as-of date.
