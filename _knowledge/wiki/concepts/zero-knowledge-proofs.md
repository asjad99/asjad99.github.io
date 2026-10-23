---
type: concept
sources: [src-0001, src-0002, src-0006]
updated: 2026-10-23
---
# Zero-knowledge proofs

A zero-knowledge proof is a small, checkable "receipt" that a computation was done correctly, which can hide the
private inputs. Checking the receipt is fast; making it is slow. The idea dates from the 1980s, but it became
practical only when general tools like a [[zkvm]] appeared.

## Key points
- Third option for trust: instead of trusting an institution or re-running the work, verify a proof.
- Example: prove "over 21" without showing a birthday (src-0001).
- A proof shows the program ran as written, **not** that the program is correct. Trail of Bits forged a "better"
  result by exploiting bugs in Google's guest program, not in the proof system (src-0006).
- Cost: proving is hundreds to thousands of times more work than plain computing (vendor figures).

## Related
[[zkvm]] · [[succinct]] · [[rollups]] · [[content-provenance]]

## Sources
src-0001, src-0002, src-0006 — see `raw/sources.md`.
