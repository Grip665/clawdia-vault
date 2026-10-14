# CAROL — Case Management Automation

## Overview
CAROL = Case-manager, Autonomous, Review, Organization and Learning
Larry's primary work tool — automates documentation on phoenix.scdhhs.gov

## Status: 🟡 WORKING
- MC narratives: Auto-fill working (29 done July 2)
- QV narratives: Working
- REV narratives: Working
- Service Plan: Working (but careful with Complete/Sign)

## Scripts & Key Files
- **Workspace:** `~/.openclaw/workspace/CAROL/`
- **Form map:** `~/Desktop/SCDHHS/CAROL_FORM_MAP.txt` (DESKTOP BACKUP)
- **Prewrites:** `~/Desktop/Prime_prewrites/` (77 participant docs)
- **Current month:** `~/Desktop/July_MCs.docx`, `July_QVs.docx`, `July_REVs.docx`

## CAROL Dashboard
- Fable 5 generated single-file HTML dashboard: `~/Desktop/4Sight/notes/carol-dashboard.html`
- Dark theme, shows MC/QV/REV schedule, participant list with due dates

## Workflow Rules
1. Always use CDP (Playwright + port 18801), not Puppeteer
2. Use `ctx.newPage()` — don't navigate Larry's active tab
3. MC format: "The CM spoke with [participant/AR] by phone for monthly contact..."
4. Exception codes: NO personal care → "no new exception codes". Has personal care → list codes with "and" not commas
5. NEVER save Complete/Sign page unless explicitly told
6. Always update Desktop backup alongside workspace

## Filter IDs
- REV: `search_narrative_type_id_is_any_4` (val 4)
- QV: `id_3` (val 3)
- MC: `id_2` (val 2)

See also: [[project-state]], [[decisions-log]]
## 🗣️ CAROL narrative wording — Larry preferences (2026-10-13)
- **A stated appointment AUTOMATICALLY overrides the standard "does not have any healthcare appointments scheduled for this month" clause** — hoist it into the greeting block. Do NOT ask for approval on this; just make the change.
- **Apply stated health changes inline** (illness, diagnosis, upcoming visit) without making Larry approve each one. He does NOT want to review wording drafts line-by-line — "if I'm doing all of this I can write them myself."
- **"No changes with daily routine" is OK even alongside a symptom** (e.g. Mattie Tollison: leg pain, routine unchanged) — a symptom alone does not require softening that line. Only soften when the *routine/plan* itself is contradicted (e.g. Pamela Fowler kidney failure + happy-with-plan).
- Elbert Meredith (9857159) QV = **AR voice, Tracy Young** (he/his, AR she).

## ⚠️ CAROL QV batch — contact date (2026-10-13)
- **Confirm the date of contact BEFORE filling** — do not silently default to "today".
- This batch (Fowler / Davis / Tollison / Meredith / Brown QVs): **contact date = 10/12/2026.**

## 2026-10-13 QV batch — results (contact date 10/12/2026)
- Fowler 9853029 (L5,E,L1,L4,M,L2,L6) · Davis 9798336 (L4,E,D,B,M) · Meredith 9857159 AR/Tracy Young (E,B) · Brown 9915087 (L5,G3,M,D,L6) — all filled + saved_draft on the 3060 lane.
- Tollison 9825750 — NOT redone; saved earlier with the wrong date (10/13), Larry fixes the date by hand (no duplicate).
- Invocation gotchas: run `auto` then `save` as SEPARATE commands (auto leaves the form open / process hangs); pass JSON opts via a `.cmd` with `\"` escaping (PowerShell mangles them).

## Pamela G Fowler (9853029) — kidney failure wording (2026-10-13)
- Correct phrasing: she was **DIAGNOSED** with kidney failure — NOT "being treated for".
- Use: "The participant reported she was diagnosed with kidney failure."
- Larry corrected my 10/12 QV draft manually (I had written "is currently being treated for kidney failure").
