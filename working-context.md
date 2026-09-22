# Working Context

**Updated:** 2026-09-21 22:30 EDT
**State:** IDLE (awaiting Larry)

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
