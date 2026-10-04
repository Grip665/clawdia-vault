# Project State

## Media Server 🟢
Jellyfin + Zurg + Riven + Real-Debrid on HP. Streaming locally & remotely.
Riven with Torrentio/Knightcrawler scrapers. 571 RD torrents.

## AuthentiCare 3.0 🟡
Blocked on E5 Play (32-bit OS, INSTALL_FAILED_NO_MATCHING_ABIS).
Orbic RC609L pending verification. LineageOS backup plan.

## CAROL 🟢
Case management automation. **HOSTED ON THE 3060** (cutover 2026-10-03) — reachable via her own Telegram bot;
models = DeepSeek direct primary + OpenRouter fallback; pipeline at `workspace-carol/CAROL` on the 3060.

## 4 Sight IPTV 🟡
App built, needs Strong 8K wholesale source.

## Visual Therapy 👕
Website skeleton. On hold.

## ComfyUI/ViewComfy 🟡
Running on 3060. Workflow JSON saved, pending ViewComfy integration.

## 🗓️ Senator Ops Calendar App (2026-08-18) 🟡
- Larry wants a calendar app: all due dates, bills, nurse visits, interviews, payroll in one popup.
- Data package built: `Desktop/Calendar-App/app_data.json` (10 bills, 38 nurse visits, 3 interviews, 57 payroll calls, 28 transport billing, 188 events total).
- Exports: 4 ICS calendars (Home, Payroll Shifts, Bills, Nurse Visits) on 3060 + workspace/calendar-export/.
- Next: pick platform (Flutter/web) when Larry's ready.


## 🗺️ Visit Planner Map (route optimizer page) — 🟡 dormant
- **File:** `~/.openclaw/workspace/visit-planner-map.html` ("Visit Planner — Greenville", Leaflet + markercluster).
- Markers w/ filters (REV/QV/MC/PHONE/DUE/DONE), route optimizer (nearest-neighbor from home base), drag-reorder,
  Google Maps handoff, CSV add, localStorage store. Built ~2026-07-16/20; last touched 2026-07-20.
- Status: **unfinished** (Larry 2026-09-27). Not served anywhere yet; open the file directly.
- Control Center popup fix (3060) 2026-09-27: hidden launcher VBS + watchdog rewrite; see daily note.
