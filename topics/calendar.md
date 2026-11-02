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

## 2026-11-01 — "move everything" pass (pre-Vance-UI)

Larry's directive: all of his stuff (work, personal, everything) has to be in Google Calendar **before** the UI
gets built with Vance; the provider-only lane (B) comes after that.

**Added — 6 recurring (verified read-back from the target, 3-reminder set):**
| event | rule | first |
|---|---|---|
| Piedmont Natural Gas - bill due | `FREQ=MONTHLY;BYMONTHDAY=25` | 11/25 |
| Greenville Water - bill due | `FREQ=MONTHLY;BYMONTHDAY=25` | 11/25 |
| Raj cable - pay | `FREQ=MONTHLY;BYMONTHDAY=1` | 12/01 |
| Therap login | `FREQ=MONTHLY;BYMONTHDAY=1,16` @ 09:00 | 11/16 |
| Phoenix pay period STARTS | `FREQ=WEEKLY;INTERVAL=2;BYDAY=SU` | 11/08 |
| Phoenix pay period ENDS | `FREQ=WEEKLY;INTERVAL=2;BYDAY=SA` | 11/07 |

**Added — 3 operational series recovered from the iMac "Home" calendar** (they existed only as 130 one-off
all-day instances; collapsed to 3 RRULEs, all retimed to 11:00 so the alert isn't stuck at 9 AM):
`Run payroll documents - DDSN Medicaid` weekly WE · `Payroll call - Home Health (Thurs before 3PM)` weekly TH ·
`Transportation billing` every other WE (anchor 8/26/26).

**Phoenix pay-period cadence (derived, worth trusting):** biweekly, **Sunday → Saturday**, 14 days.
Anchor from the 08-14 training calendar: **8/2–8/15**; cross-checked against the DSN run log **9/27–10/10**. ✅
Docs for a period: resolutions report (2 wks) + provider activity summary (2 wks) + DSN billing (2 wks);
processed the following Wednesday, payroll call Thursday before 3 PM.

**Imported — 25 dated events from a FRESH iMac pull (not the Aug 18 ICS):** 19 nurse visits + 6 payroll-shift
exceptions. AppleScript dump (`every event` across Home/Work/Nurse Visits/Payroll Shifts/Bills, epochs computed
inside AppleScript to dodge locale date parsing) returned **195 events**, identical in shape to the 8/18 export →
the iMac calendar itself is the same snapshot, so nothing had drifted.

**Deliberately NOT imported:** 59 past events (history) — can be backfilled on request.
**Already covered on Google under different titles:** USLI, biBERK ×2, Verizon Connect, NOW Insurance,
business license 12/31, DPH license 2/28/27, weekly tasksheet pull (Mon) — no duplicates created.

**⚠️ Open discrepancy:** USLI is **$907.20** on the calendar but **$902.00** in the iMac Bills.ics and in memory
(3 payments of $902). One of the two is wrong; needs Larry to confirm off the policy.

**Next phase = lane B** — needs the **agency** Google account, its own Cloud project, own service account +
key (`google-sa-agency.json`), calendar `PHC Planner` shared to Larry. Never reuse the personal key.

## 2026-11-01 (later) — "Mac no personal stuff" audit → the Mac is already clean ✅

Larry: *"The mac shouldn't have had Raj on there at all. I don't want any personal information on the mac."*

**Result: there is zero personal data in the iMac's calendar, and Raj was never there.**

Full AppleScript enumeration of every calendar on the iMac (2026-11-01):

| calendar | events | content |
|---|---|---|
| Home | 137 | payroll docs / payroll call / transportation billing (3 series) + interviews |
| Nurse Visits | 38 | participant visits (name + CLTC id) |
| Bills | 7 | biBERK ×2, USLI ×3, Verizon Connect, NOW — all BUSINESS policies |
| Payroll Shifts | 6 | moved-up payroll dates |
| Work | 7 | business license + DPH license renewals |
| Scheduled Reminders / Birthdays / Siri Suggestions | 0 | empty |
| US Holidays | 122 | system holidays |

- **Personal scan:** no Raj, no cable, no IPTV terms, no personal subscriptions anywhere in the 195 events.
- **PII scan of the exported ICS:** no SSNs, no account/routing/card numbers, no personal email addresses —
  and **no DESCRIPTION fields at all**, so there are no free-text notes to leak either.
- The Raj cable reminder he was thinking of is **not on the Mac** — most likely his phone's Apple/iCloud
  calendar, or he was remembering that he'd meant to add it (it was **not** on Google before today either).
- Up-to-date porting done: **future only** (19 nurse visits + 6 payroll shifts). The 59 past events stay on the
  Mac as history — matches his "if we have up-to-date events to port, that's fine".

**Rule going forward:** the iMac is a BUSINESS machine. Nothing personal lands there — no personal bills,
no personal subscriptions, no family/personal appointments. Personal lives in his Google only.

**At the splinter:** business moves to the agency-owned `PHC Planner` lane; personal stays in his personal
Google. The Mac's business calendar gets pointed at the agency lane, not at his personal one.

### ⚠️ Google TASKS are invisible to the robot (2026-11-01)
Larry's "Cable+Sharonview" (2 PM) and "Phone" (1 PM) turned out to be **Google Tasks** — the blue checkbox items in the
Calendar app — not calendar events. That's the whole reason nothing could be found by name anywhere.
- The **Calendar API `events` endpoint never returns Tasks.** They are a separate product.
- The **Tasks API cannot be used with a service account on a personal Gmail account** — that requires Workspace +
  domain-wide delegation. So there is no path for the robot to read or write his task list.
- **Implication:** anything Larry wants automated, reminded, migrated, or managed must exist as a **calendar EVENT**.
  Tasks remain a manual checklist only. When a recurring task matters operationally, recreate it as an event and let him
  retire the task so he isn't double-reminded.
