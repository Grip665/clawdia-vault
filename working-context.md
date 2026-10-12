# Working Context

**Status:** Idle — end of day Sunday 2026-10-11 (22:00 EDT)

**Last activity (2026-10-11 evening):**
- **Berrios payroll deep-dive + tracker reframed (resolution-centric).** Pulled provider-side reports read-only via CDP (3060 Chrome): Resolutions 8774879 + Provider Activity 8774878 (1:14 PM) → then Berrios-individual (8774943/44/46, 16:52). Rebuilt `PROVIDER/reports/RESOLUTION-TRACKER-2026-10-11.md` → Section 1 = AIDE MONEY AT RISK.
  - At-risk: 2 DENIED (Jones/Smith Jimmie 10/07+10/08) · 3 accepted-but-$0 (Hardy: Grayson U85W, Benson K8OI, Hughes V5EH).
  - **Berrios owed ≈ ~24 h from prior period (09/13–09/26)** — Medicaid paid the company but she was never credited (she didn't know the hours existed). This period: worked 64.1 h, paid 27.6 h; billable 61 h → only ~5 h actually missing this period. Should be credited **~84 h** total. Missing hours are on a **resolutions sheet at the office**. **Berrios will call.**
  - 2 resolutions still pending CLTC (4FUZ Dawkins/Whitehead · YRKU Berrios/Wilson KY) → must clear by **Wed 10/14** or manual aide pay add.
  - Next Medicaid RA **Fri 10/16** (≈dos 10/05–10/10).
- **Memory architecture: #1 + #3 live** (Claude Sonnet review → Larry approved top 3, "only if it doesn't break anything").
  - #1 memory-health watchdog: `~/.openclaw/memory-watchdog.sh` + cron `e35af2d2` (15-min, silent unless unhealthy).
  - #3 store hierarchy: vault = CANON; Hindsight/daily/MEMORY.md = derived. AGENTS.md "Memory Map — SOURCE OF TRUTH" + MEMORY.md MAP header. Backups `.bak-memmap-20261011-2155`. Created `vault/_inbox.md`.
  - #2 recall eval set created `workspace/memory-eval/recall-eval.md` (18 items).
  - Hindsight LLM repointed **OpenRouter → DeepSeek direct** (`deepseek-chat`) — fixed the 2-wk silent death from the OR-credit outage.
  - Decision logged in `vault/decisions-log.md`.

**Waiting on Larry:**
- Confirm the ~24 h Berrios catch-up (verify the resolutions sheet at the office) before crediting her.
- Modivcare/TP admin change — confirm new admin (Dinasti vs Thomas/Pierre Dupree) before building the letter.
- Therap Super Admin CHANGE letter (Dinasti Jones) — rendered, pending submission.
- Optional: enable OpenRouter Auto Top-Up.

**Next up:** (1) Re-pull resolutions before the **10/14** close to catch CLTC accepts (or schedule a manual aide pay add). (2) Fix Berrios catch-up hours. (3) Re-run the full eval set when convenient (3/18 done, all HIT).

## ⏸️ Open / tabled
- **Berrios catch-up (~24 h, period 09/13–09/26)** — awaiting the office resolutions sheet; she'll call.
- **Modivcare (TP portal) admin change — TABLED 2026-10-09.** New admin = **Dinasti** or **Thomas/Pierre Dupree**? SCNetwork@modivcare.com / 866-779-5200.
- **Therap Super Admin CHANGE** — letter rendered (Dinasti Jones), pending Larry's submission.
- **Dinasti Jones strike limit** — do not re-file her resolutions until the strike clears.
