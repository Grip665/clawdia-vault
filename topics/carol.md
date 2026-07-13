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