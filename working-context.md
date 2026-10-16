# Working Context

**Status:** Active — 2026-10-15 (Thursday) ~13:05 EDT. Larry is opening a NEW context window. **Live work = PHC compliance binder (dual-regulator: DPH R.60-122 + SCDHHS HCBS).** Done today: analyzed SCDHHS Compliance Review #44601 (score 237 → Corrective Action; see `PROVIDER/compliance-review-44601/` + `PROVIDER/reports/COMPLIANCE_REVIEW_44601_findings.md`); audited P&P manual vs admin items; re-cut the two 00 cover sheets; built **3 new admin docs** at `~/Desktop/PHC_ADMIN_ADDON_2026-10-15/` (01_Organizational_Chart, 02_Policy_SCDHHS_Notification_of_Change, 03_Policy_Business_Hours_and_Office_Coverage — PDFs also sent on Telegram for Tab 7). **OPEN:** (a) org chart #1 needs re-cut — NSPVs = **Chanelle Allen + Carolyn Dorman**, drop Office Manager row; Larry may remove Chanelle (next task) so it's HELD until he says go; (b) still no manual/index changes (he said don't touch it). Also: Hindsight Tier-1 spend cut applied earlier today (retainEveryNTurns=3, retainToolCalls=false, obs cap 800); OR watchdog switched to delta-based. Tier-2 (`enable_auto_consolidation:false`) still held.

✅ **DONE (2026-10-15 10:00) — CAROL handoff reminders armed/delivered:** oct19 (cron ad845c12, day-before) + oct20 8:30AM (c750... c754dff3, morning-of) were already armed. The **oct15 9:00 AM** heads-up was never armed and its slot passed -> **delivered late at 10:00** (BOQTraining@scdhhs.gov advance compliance questions due COB **TOMORROW Fri 10/16**). Recurring 3rd-Tuesday monthly version OFFERED to Larry, not added. Source: `hermes-share/_to-vance/CAROL-CLAWDIA_larry-telegram-reminders_2026-10-14.md`.

**Last activity (2026-10-13, 13:50–17:00): Task-sheet MARK-UP audit v3 (iterated 3×)**
- Built `PROVIDER/scripts/build_audit_v3.py` + `build_audit_sheet_docx.py` → `PHC_TaskSheet_Audit_Sheet.docx/.pdf` (97pp, 2026 active+recent+CPCA, 37 participants): 81 missing sheet-weeks · **314** MARK days · 279 documented blanks.
- Added CPCA clients (Wilson 9892407, Hayes 9883954, Garrison 9905269) via per-visit path; extended grid through 2026-10-10 (Q4 chunk).
- **Key bug found:** audit blank-detection is only as good as the tasksheet pull — the 10/05 pull was BROKEN for some weeks (e.g. Jimmie 04/27–04/30). Rebuilt off FRESH pulls (reports 8784004 + 8784006) → MARK 378→314 (−64 false positives). **Always pull tasksheets fresh per run.**
- Killed an orphaned polling loop the runaway build sub-agent left on the 3060 (Session 0, ~58 CPU-min). ⚠️ Lesson logged in mistakes.md: ASK before background builds/portal pulls. Do NOT disable bgutil-pot-watchdog (it's the instrumental-pipeline PO-token self-heal, not the culprit).

**Last activity (2026-10-13, 11:54): In-service sheets + Roxie 7/21–8/3**
- Built **page 2** of the annual in-service video links (topics 11–20) → combined `PHC_InService_Video_Links_2page.pdf` (2pp) + page1/page2; Larry printed; all dropped into the InService Folder Kit (`~/Desktop/Home Care documents/Employee Files - Compliance/SCDHHS-Forms/InService-Folder-Kit/`).
- Roxie Sheet C (07/21–08/03/24) intentionally partial (build capped ≤2024-07-22); Larry says a physical folder sheet already covers 7/23–8/1 → no rebuild.
- Note: `scripts/ddsn_fill_roxie.py` hard-caps days at <=2024-07-22.

**Last activity (2026-10-13, 00:14–00:50): CAROL QV batch (5 narratives), contact date 10/12/2026**
- Filled via carol.js on the **3060 CAROL lane** (Chrome 18801), all `saved_draft` for Larry's review:
  - Pamela G Fowler 9853029 — L5,E,L1,L4,M,L2,L6 — custom body (kidney failure hoisted)
  - Christopher C Davis 9798336 — L4,E,D,B,M — custom body (appointment overrides "no appointments")
  - Elbert Meredith 9857159 — E,B — AR voice (Tracy Young), template `auto`
  - David Brown 9915087 — L5,G3,M,D,L6 — template `auto` + housing-search extra
  - Mattie L Tollison 9825750 — NOT redone (earlier save had wrong date 10/13; Larry fixes date manually to avoid dup)
- **Lessons:** (1) ALWAYS confirm date of contact before filling — defaulted to today and used 10/13. (2) `carol.js auto`/`narrative` leaves form open + process hangs → run `auto`, then `save` in a SEPARATE invocation. (3) JSON opts must go via a `.cmd` with `\"` escaping — PowerShell mangles quotes.

**Prior activity (2026-10-12, 10:38 AM–9:15 PM):**
- **Berrios pay + all-worker resolutions.** Berrios 09/27–10/10 = 66.0 payable h / $1,650; **all 6 resolutions accepted** — last holdout V 261009-YRKU cleared 10/12 → nothing floats. All-worker Resolutions 8777473: 21 acc+strike / 2 acc / **2 DENIED** / 0 pending. All-worker Provider Activity 8777517: 09/27–10/10 = **827.3 h / $20,308.70** (17 workers). Tracker: `PROVIDER/reports/RESOLUTION-TRACKER-2026-10-12.md`.
  - New $0-billable: Horne (Garrison 10/09), Smith/Christina (Watson 09/30), Bullock (Johnson 09/30) + Hardy's 3 + Jones' 2.
- **Roxie Johnson DSN sheets** 2/18/24–7/22/24 rebuilt v2 → printed 12 single-sided. Page-size fix in `scripts/ddsn_fill_roxie.py` (`to_letter_landscape`). 2/18–3/02 week 2 confirmed blank (310 CMS-1500 batches checked).
- **Therap call (1 PM)** cheat sheet → `~/Desktop/PHC-Therap-Reset/Therap_Call_Sheet.pdf`. ⚠️ **NPI in use = 1295369312 (Diane Martin, former owner)** — not Dinasti's 1831815539.
- **Activities Tasksheet packet** 9/27–10/10 (report 8778179) → 84 pp / 30 participants, printed.
- **Nurse compliance:** method = Phoenix Reports → Provider Activity incl **Service Type=SUPV**; report 8778715 (49 visits). Overdue: Terra Thomas, Jason Hoover, Manuela Cohen; DSN Sandra Smith + David Bosworth. 2nd nurse = **Carolyn Dorman**.
- **Ops/misc:** EVV app support **800-441-4667** · SCDHHS (888) 289-0709 opt 4; car battery-light diagnosis (2010 Accord → alternator/regulator); 22 visit addresses → `~/Desktop/October_2026_visit_addresses.csv`; WellRyde TripLog pulled + printed; **reminder set Tue 10/13 9:00 AM — Shirley Renee Watson in hospital**; AI-video (NDI 1.0/Nace AI) reviewed → pass.

**Carry-over (still open):**
- **10/14 payroll** — Berrios 66 h should key; watch Hardy $0s + Jones strike limit.
- **Berrios catch-up ~22 h (period 09/13–09/26)** — await the office resolutions sheet / Larry's confirmation of the "~44 h keyed" figure before crediting.
- **Next Medicaid RA Fri 10/16.**
- **Nurse follow-ups:** Thomas / Hoover / Cohen (+ DSN Smith / Bosworth); refresh stale `PHC_Nurse_Visit_Matches_2026.xlsx` (~8/27).
- **Reminder fires Tue 10/13 9 AM** (Shirley Watson).
- **Modivcare (TP portal) admin change — TABLED.** New admin = Dinasti or Thomas/Pierre Dupree? SCNetwork@modivcare.com / 866-779-5200.
- **Therap Super Admin CHANGE** — signed letter + DL ready (`Desktop/PHC-Therap-Reset/`); pending Larry's submission (Super Admin → Dinasti Jones).
- **Dinasti Jones strike limit** — do NOT re-file her resolutions (Smith/Jimmie 10/07+10/08 DENIED) until strike clears.
- **Hardy, April** — 3 accepted-but-$0 (U85W / K8OI / V5EH) → won't pay; chase.
- Optional: enable OpenRouter Auto Top-Up.
- Finish the recall eval set when convenient (18 items, 3/18 done all HIT).

**Memory architecture (live 10-11):** #1 memory-health watchdog (cron `e35af2d2`, 15-min); #3 store hierarchy (vault = CANON); #2 recall-eval set. Hindsight LLM → DeepSeek direct.
