# Calendar — LIVE (created 2026-10-27)

## Credentials
- **Service account key:** `C:\Users\User\.secrets\google-sa.json` on the **3060** (ACL: read-only, no inherited perms)
- **Service account:** `planner@larrrys-planner.iam.gserviceaccount.com` · project `larrrys-planner`
- **Cloud project owner:** Larry's personal Google (`grip694@gmail.com`) — project #1, personal lane
- **Calendar:** `grip694@gmail.com` (primary) — shared to the service account at "Make changes and see all event details"
- **Calendar ID file:** `C:\Users\User\.secrets\calendar-id.txt`
- Library installed on 3060: **google-auth 2.62.0**

## Verified (2026-10-27 13:2x)
- Read: `calendars/{id}/events` → 200. `calendarList` → 0 (normal for service accounts; they reach by ID only)
- Write: POST 200 · GET 200 · DELETE 204 · gone from listings
- **17 events seeded**, then **rebuilt as TIMED events, **11:00 AM** (Larry: at work, sitting down then)** (not all-day) so alerts can fire at a real clock time — first set 10:00, moved to **11:00** the same day
- **Reminders on every seeded event:** email 3 days before (4320 min) · popup 1 day before (1440) · popup 1 hour before (60)
- Recurring: NOW (mo/5th) · biBERK WC 080186 (mo/13th) · Senator WC (mo/24th) · CM contacts + QVs (mo/25th) · tasksheets (weekly Mon)

## Seeded set
QV EOB 10/30 · weekly tasksheet pull (Mon) · NOW $80.59 (mo/5th) · Thomas/Senator Progressive commercial auto 11/06 (NOT Larry's) ·
USLI $907.20 11/09 · biBERK PL $279.45 11/12 · biBERK WC $524.63 (mo/13th) · Verizon $116.95 11/14 ·
Senator WC $517.42 (mo/24th) · CM monthly contacts + QVs (mo/25th) · NOW renewal 12/05 ·
biBERK WC renewal 12/13 · Business license 12/31 · USLI $902 01/08/27 · DPH license 02/28/27 · USLI $902 03/09/27

## Notes
- ⚠️ Calendar was NOT empty — two pre-existing events: **"Case Management Office Hours" 2026-10-19 10:00** and
  **"Cancel Seek" 2026-11-09 12:30**. Both left untouched.
- **API gotchas learned the hard way:** (1) Google **rejects** patching an all-day event into a timed one
  ("Invalid start time") — you must delete and recreate; (2) **recurring** events require an explicit
  `timeZone` field on start/end, an ISO offset alone returns "Missing time zone definition";
  (3) Windows Python needs `pip install tzdata` for `zoneinfo` — installed.
- Default all-day reminders apply (9am day-of) — per-calendar tuning still to do.
- **Agency lane (project #2 + `PHC Planner` calendar) NOT built yet** — deliberately deferred until Larry's own calendar is live.
