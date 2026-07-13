# Mistakes Log

**Format:** `YYYY-MM-DD — What happened — What I learned`

## 2026-07-13
- **Memory wipe** — Context pruning during long Vegas session wiped 9.9MB of trajectory. Had to reconstruct from logs.
  → **Fix:** Implemented Phase 1 Hindsight tuning + Phase 2 Obsidian vault. Now writing to vault mid-session.

## 2026-07-11
- **Hindsight over-reliance** — Assumed Hindsight auto-recall would preserve session context during long conversations. It didn't — context pruning killed mid-session continuity.
  → **Lesson:** Write comprehensive daily notes. Don't rely on Hindsight for mid-session recall. Trajectory logs are the fallback.

## 2026-07-05
- **Automated exam answering** — Built scripts that read questions from DOM but used keyword matching instead of understanding the content. Failed 7 out of 8 tests.
  → **Lesson:** Manual analysis of all 20 questions first → then submit. Reading slides first saves time.

## ~2026-07-02
- **CAROL exception codes** — Listed two codes with comma instead of "and" (e.g., "E, D" instead of "E and D").
  → **Fix:** Template corrected.

- **Atomic wallet** — Sent crypto from Coinbase to Atomic wallet, exposing the address to Coinbase.
  → **Lesson:** Atomic is "burned." Use fresh wallets going forward.

## 2026-06-19
- **Service Plan save** — Almost saved the Complete/Sign page which would've locked everything without Area Office review.
  → **Fix:** Never save Complete/Sign page unless explicitly told to.