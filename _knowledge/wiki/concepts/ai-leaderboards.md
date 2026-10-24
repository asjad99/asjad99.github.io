---
type: concept
sources: [src-0021, src-0024, src-0025, src-0026, src-0027, src-0031]
updated: 2026-10-24
---
# AI leaderboards

Sites that rank AI models. They measure different things: human preference votes (LMArena), quality/speed/price
(Artificial Analysis), long-run capability trends (Epoch AI Capabilities Index), agent task length (METR time
horizons), agent terminal tasks (Terminal-Bench), and side-by-side prompt tests (ModelCompare).

## Key points
- LMArena: anonymous pairwise votes → Bradley-Terry/Elo-style scores; category tables; Arena Intelligence Inc.,
  $100M seed (May 2025) (src-0025).
- Cautions: preference ≠ correctness (style bias); benchmark contamination; small gaps are noise.
- "The Leaderboard Illusion" (2025): big providers got more arena data and could test private variants, publishing
  only the best (src-0027).
- ModelCompare: claims OpenAI or Anthropic held the top score on 96% of days since Sept 2024 (vendor analysis, src-0021).
- Terminal-Bench 4.0: agent tasks in a terminal; flat 8-hour timeout; 19 tasks fixed, 8 removed (saturation,
  refusals, public solutions, quality); run with the Harbor framework; leaderboard on Harbor hub (src-0031).
  Task count and scoring details not stated on the release page.

## Related
[[keeping-up-with-ai]]

## Sources
src-0021, src-0024, src-0025, src-0026, src-0027, src-0031.
