# Working Context

**Updated:** 2026-09-22 21:00 EDT
**State:** ACTIVE — PHC binder scan intake (Larry uploading tab-by-tab ZIPs)

## NOW (2026-09-22): PHC Policies & Procedures Manual rebuild
- Larry is uploading scans of his physical binder, one ZIP per tab. **His scans = source of truth.**
- Workflow agreed: his scan → I add/change BY SECTION → format pass → Claude/Vance review.
- Intake + page maps: `~/Desktop/PHC-SCANS-2026-09-22/NOTES.md`. Raw: `.../raw/`. Renders: `.../png/`.
- **Received: Tab1** (14pp = his CURRENT manual, 12-section order, footer has address/phone, NO page numbers).
- Pending: more ZIPs; move misfiled admin paper Tab4→Tab7; swap in "old forms that look better"
  (archive displaced to `_staging/displaced_forms_2026-09-22/`); nurse 4-month template→Tab2; Tab6 insurance.
- Improved disaster suite built: `~/Desktop/PHC-Disaster-Plan_D1_D2_D1C_IMPROVED_2026-09-22.docx/.pdf`.
- Scans mapped: Tab1-6 + nurse/disaster zip. See `~/Desktop/PHC-SCANS-2026-09-22/NOTES.md`.
- ✅ BUILT (v2, Larry's font/style): `~/Desktop/PHC_Nurse_Supervisory_Assessment_MASTER_2026-09-22.docx/.pdf`
  — 1 page, Times New Roman, logo emblem, 10 q, visit-type slots Initial/30-Day/4-Month/Other.
  Calibri v1 archived to _staging. In Tab2_Client_Packet.
- **ALL BLOCKING Qs RESOLVED 19:49:** office hours = **Mon-Fri 10:00 AM - 4:00 PM**; both numbers
  (485-2079 office / 652-5100 24-7); job description = newer only; File Compliance on top + Key Dates last;
  retired `11_Supervisory_Visit_Report`; nurse master form = `11_Nurse_Supervisory_Assessment`.
- **NEW VERSION folder = `~/Desktop/PHC_BINDER_NEW_2026-09-22/`** (README = change log). Reference untouched.
- ✅ **ASSEMBLED + REVIEWED:** `~/Desktop/PHC_BINDER_COMPLETE_PRINT_2026-09-22.pdf` = 127 pp, all US Letter,
  in binder order. Claude's 33-finding review received; mechanical fixes applied; re-pushed to 3060 at
  `C:\Users\User\Desktop\PHC-BINDER-FINAL-2026-09-22\` with CLAUDE_REVIEW_PROMPT.txt + FIXES_APPLIED_2026-09-22.txt.
- ⏳ AWAITING LARRY: sign/date manual (F1), designation (F2), experience verification (F3); rescan DPH license
  (F4); decide F12 (his 3 visit slots vs Claude's §5.5 objection); content fixes F7-F11, F13, F18, F20, F23.

## Prior task (2026-09-21) — Planner sync

## Just completed
- Read the forwarded Claude build zip (8 files) + Vance's audit doc + Planner_app doc.
- Verified all 8 SHA256 hashes match Vance's table → same artifact, two independent audits.
- Ran the suite on the HP: **22 passed** (101s vs Vance's 2.34s — fsync/disk, not a defect).
- Wrote **PHC-Planner-Migration-and-Interface-Contract.md** (Desktop/PHC-Planner/ + workspace).

## Decisions locked
D1 canonical = sync.db · D2 host = HP not 3060 · D3 no Caddy · D4 initials-only
data rule · D5 CC repoint = read AND write. Details in vault/decisions-log.md.

## Blockers
- **3060 offline** (`No route to host`) → cannot export the 25 tasks + 7 reminders.
  Only Clawdia can produce that export (needs the existing schema). Waiting on the box.

## Next
1. Export 25 tasks + 7 reminders once 3060 is up.  <- still blocked
2. ~~Fix B1 + B2~~ DONE — staged in ~/Desktop/PHC-Planner/server/, 25 tests pass.
3. Deploy on HP: PHC_SYNC_PORT=8766, protect from RAM watchdog, verify reboot + loopback-only.
4. Repoint Control Center tasks/reminders slice (read AND write).

## 22:45 — Deployment staged (verified, NOT started)
- Ran the real server on the HP: `/health` → `{"ok":true}`, bound **127.0.0.1:8766 only**,
  off-loopback bind refused. Deploy path proven end-to-end.
- **Gaps found by doing it:** `python3 -m venv` FAILS on the HP (pip bootstrap error) and
  PEP668 blocks system installs → deps go in a `--target` dir + `PYTHONPATH`. **waitress was
  not installed.** Port 8766 free; 8765 is the voice bridge (don't touch).
- Artifacts: `~/Desktop/PHC-Planner/deploy/{phc-sync.service,install-hp.sh}` +
  `~/Desktop/PHC-Planner/server/` (25 tests green). Mirrored to `hermes-share/PHC-Planner/`.
- `systemd-analyze verify` caught 2 defects in my own unit: `StartLimitIntervalSec` was in
  `[Service]` (belongs in `[Unit]`), and `ProtectHome=read-only` would sit over the
  ReadWritePaths for an app living under /home. Both fixed; verify now clean.
- Staged at `/home/lgf150/phc-sync/` (code + lib + data/sync.db). **Service NOT installed**,
  nothing on 8766.
- To go live: `~/Desktop/PHC-Planner/deploy/install-hp.sh --start` (needs sudo).
- RAM watchdog: add `*sync_server*` to `protect_cmdline()` before starting, or it's a kill target.
