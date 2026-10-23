---
type: concept
sources: [src-0003, src-0004]
updated: 2026-10-23
---
# Rollups

A rollup is an "express lane" beside a blockchain: it processes many transactions off the main chain and posts a
summary back. A [[zero-knowledge-proofs|ZK proof]] lets the main chain check the summary is honest without redoing
the work.

## Key points
- Optimism named [[succinct]] its preferred ZK proving partner (Feb 2026, src-0003).
- Base (Coinbase) went live with SP1 proofs in May 2026; withdrawals backed by proofs finalise in about a day instead
  of seven (src-0004).

## Related
[[zkvm]] · [[succinct]]

## Sources
src-0003, src-0004.
