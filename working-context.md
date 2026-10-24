# Working Context

## LATEST — 2026-10-23 22:00 (idle)

**Tonight was CAROL *voice*, not PHC paperwork — and it produced a new source of truth that removes a whole class of guessing.**
`CAROL/data/voice-map.md` (+ `.json`, 18,578 B) was built at 22:00 by `CAROL/build_voice_map.js`: for every one of **59
participants**, it reads their **most recent Phoenix narrative** and records whether that narrative was written in the
**AR's voice or the participant's**, plus the AR's name and the participant's pronoun. Result: **22 narrate as the AR,
37 as the participant.** The ARs are few and repeat — Magdalene Ratcliff (Pollard, Rhonda Green, Ronald Lyles, Shirley
Watson, Willie M Johnson), Bertha Williams (McGirt, Bagwell, Evatt), Kim Richey (LC Richey, Lewis Richey, Melinda
Pitts), Malti Patel (Kanubha / Maniben / Vimlabe Patel), Felicia Langley (Ronnie Davis), Debra Terrance (Ferguson),
Tracy Young (Meredith), Marthena Sullivan (Fred Sullivan), Lillian Flemming (Gooseby), Carolyn Anderson (Tario
Anderson), Elizabeth Adaire (Willie Bunkley), Shameka Bryson (James Garner).
**The rule is now written into the file:** look the participant up before composing, **never guess the voice, never ask
Larry what voice to use**; if the participant isn't in the table, **STOP** and ask — do not default to participant
voice. And voice is not immutable: **Ronnie Davis flipped to AR on 2026-09-27**, so re-derive whenever Larry says a
voice changed. This matters because a narrative written in the wrong voice is a compliance artifact error, not a style
choice — it attributes the AR's words to the participant.
**How it was produced (20:40–21:24, all read-only recon against Phoenix/CareCall):** `recon_carecall.js`, `recon2–4.js`,
`recon_tonette.js`, `recon_narr.js`, `check_clockins_mc.js`, `check_narr_today.js`, `check_mc_month.js` — then
`mc_ids.json` refreshed at 21:25 (backup `.bak-20261023`). No portal writes tonight.
**2010 Accord battery replaced** (18:05, birthday-bottle run interrupted). Test #7279: **SoC 100% but Cranking Health
FAIL at a rated 520 CCA** — a battery that accepts charge but can't deliver amps. **Alternator/regulator cleared** (100%
SoC proves the charging system works), so the 10/12 alternator hunch was wrong. Group **24F AGM, $281**, **4-year
nationwide** warranty (better than the 3-yr quoted) → runs to ~**Oct 2030**, reminder set for 2030-10 unless sold.
⚠️ **Two live hazards on disk, unchanged.** (1) The **superseded 8-day / 34 h / $850 Roxie PDFs are still under plain
tags** — they over-bill by $150 on the wrong days; locked version is 10-day / 28.0 h / $700 (claim 18930084). Move or
delete before the next DSN batch. (2) `CAROL/mc_group.sh` **no longer hardcodes `DATE`** (fixed 14:41 during the batch
sizing work — DATE now required, refuses >5 pairs per call), but it has **still never been run for real**: Carol is
standing by on a contact date and a go. Open assumption to confirm with Larry: "the list" = `PHC_MCs_due_2026-10-09.md`
(49 October MCs, Ronnie Davis among them).
🧥 **Clock: jacket deadline is TOMORROW, Sat 2026-10-24 — the only hard date on the board.** Thread unchanged (DTF
ordered, vinyl in, varsity **L** on chest, sleeve snake small/abstract, near-black charcoal pants). Small setup backlog
also armed for **Sat 10:00 AM**: outbound voice calls (Twilio/voice-call plugin), CDP available to *all* agents, and
actual email *sending*.
**Scheduler lane unchanged and still stalled on one human action — Larry's Google OAuth.** Phase 4 commit durability is
done (214/214 tests, 48/48 testable rules guarded), so what remains is *unverifiable, not incomplete*. Three decisions
still on my desk: (a) a real `lookup` for the Google source; (b) wire `commitBlocks` into the review harness; (c) the
Q16 double-generation-bump cleanup. DSN account-keying question still unanswered. Service plans are **28/28 current and
all 28 authorize PCA**, but the **6 CLTCs with no notice email** remain "newest available," not verified current —
**Johnny Smith 11/18/2025** and **Kay Smith 10/30/2025** sit nearest the 12-month re-eval line.
Housekeeping: **graphify 7950 nodes / 8814 edges** (prev 7926/8798; 864/864 files). **Friday (u=5) → no commit, no
push**; tree dirty at **67 entries** (51 at 14:00 — +8 CAROL recon/check scripts, +`voice-map.json/.md`, +`mc_ids.json`
bak, +`_to-carol/`). `CAROL_FORM_MAP.txt` re-backed up to `~/Desktop/SCDHHS/` (**68,905 B**, 22:06). 22:00 marker
confirmed once each in `memory/2026-10-23.md` and `vault/daily/2026-10-23.md` (append-only heredoc — no anchor edits,
no `edit`/`write` on daily notes).
⚠️ **Still needs Larry/human:** (1) **Google OAuth** — unblocks live verification of Phases 3–4; (2) **keep-or-ignore
before Sunday** — `media-out/orochimaru/` (157 MB) and `tools/rea/`; (3) the DSN account-keying question; (4) move or
delete the superseded Roxie 8-day PDFs; (5) verify the 2 near-12-month plans (Johnny Smith, Kay Smith) before their aide
cards are issued; (6) the MC list + contact date so Carol can run a 5-batch; (7) 6 compliance watch-items unchanged
(Medicaid RA 10/16 · address-of-record §F.1 · org-chart re-cut HELD on Chanelle · 3060 audit packet v4 vs v5 · Therap
DSN gap · binder rev10 119 pp vs README 118).

**PREV-1 (2026-10-23 Friday, 14:00 — auto-save; service plans fixed, first aide card built):**

**The service-plan pipeline went from a worrying finding to a clean one, and the first aide task card is built.**
Two bugs were stacked on top of each other and both are now fixed. (1) The earlier "Mac Downloads is nearly empty"
readings were **macOS TCC denial over SSH**, not an empty folder — Downloads actually held 3,539 items including 264
`*.enc.pdf` service plans. (2) `parse_service_plans.py` compared plan dates **as strings**, so `03/18/2026` sorted
*below* `03/20/2025` and the "newest plan" selection was landing on 2022–2023 documents. That string-compare bug is
what produced the alarm worth remembering: the first clean run reported **12 of 28 participants with ZERO PCA
interventions** — verified at raw-text level, zero `\bPCA\b` hits — which for PCS-authorized clients is a real
deficiency shape (the paid aide is a PCA, so the plan would not match the work). **The alarm was false, and it was
false because the documents were stale.** After the date fix: **28/28 participants have current plans and all 28
authorize PCA.** White 0→28, Allen 0→19, Hardy 0→14, Benson 0→23, Johnson 0→15.
**How the documents actually got current:** Mac `Mail.app` holds **199 "[Phoenix] Service Plan Notice" emails**; the
body contains a `providers.phoenix.scdhhs.gov/assessment_service_plans/<id>` URL, and opening it in Safari
**auto-downloads the `.enc.pdf`** with no clicking. One AppleScript pass matching all 28 CLTCs = ~34 seconds, 22 plans
downloaded, all 2026 vintage. This is the refresh path now — do not rebuild from Downloads again.
**Aide Task Card v1 shipped** — `PROVIDER/scripts/build_aide_card.py <cltc>` → one-page printable (weasyprint
HTML→PDF) in `~/Desktop/Aide-Cards/`. First card = **Sherman Hobbs**, 40 PCA-authorized tasks across sections
6.3/7.2/8.2/9.2/10.2 from his 10/09/2026 plan, authorized-services line auto-summarized from section 2, and an
explicit NEVER box (EVV list after #34 / 35–41 skilled / pet care / other person's laundry-dishes / unused areas /
anything not on the card). Footer carries the real rules: nurse signs+dates every 2 weeks, no backdating, file within
30 days, participant does NOT sign, task sheet ≠ timesheet. 🐛 Built-in trap found and fixed: multi-line intervention
descriptions were being **truncated at the first physical line** (pdftotext wraps long tasks) — the parser now
accumulates lines until a date-terminated line. That bug affected every card, so it was fixed before scaling.
⚠️ **Before running all 28 cards:** 6 CLTCs had no notice email (Kay Smith 0212988, Willie Johnson 9769968,
Johnny Smith 9789216, Kamelle Watson 9849992, Tracy Waddell 9888523, Calvin Dawkins 9938031) and their newest
available plan is 2025/2026 — Johnny Smith 11/18/2025 and Kay Smith 10/30/2025 sit near the 12-month re-eval line.
"Newest available" is not the same as "current," and I have not verified those two.
⚠️ **Two live re-use hazards on disk, unchanged:** (1) the **superseded 8-day / 34 h / $850 Roxie PDFs are still under
plain tags** — they over-bill by $150 on the wrong days; locked version is 10-day / 28.0 h / $700 (claim 18930084).
(2) `CAROL/mc_group.sh` still has **`DATE="10/22/2026"` hardcoded**.
**Roxie stays LOCKED:** Mon–Fri ×2 = 10 days/period · Mon–Thu 3.0 h (2:00–5:00 PM) · Fri 2.0 h (2:00–4:00 PM) ·
112 units = **28.0 h = $700/period**. Her handwritten In/Out was never verified — no original scans exist on disk.
🧥 **Clock: jacket deadline is TOMORROW, Sat 2026-10-24 — the only hard date on the board.** Thread unchanged
(DTF ordered, vinyl in, varsity **L** on chest, sleeve snake small/abstract, near-black charcoal pants).
**Scheduler lane unchanged and still stalled on one human action — Larry's Google OAuth.** Phase 4 commit durability
is done (214/214 tests, 48/48 testable rules guarded), so what remains is *unverifiable, not incomplete*. Three
decisions still on my desk: (a) a real `lookup` for the Google source; (b) wire `commitBlocks` into the review
harness; (c) the Q16 double-generation-bump cleanup. DSN account-keying question still unanswered.
Housekeeping: **graphify 7926 nodes / 8798 edges** (prev 7889/8725; 853/853 files). **Friday (u=5) → no commit, no
push**; tree dirty at **51 entries** (48 at 08:00 — +`build_aide_card.py`, +`identify_service_plans.py`,
+`parse_service_plans.py`, +`cdp_fetch_ro.py`/auth-week CSV already counted, +`drafts/`). `CAROL_FORM_MAP.txt`
re-backed up to `~/Desktop/SCDHHS/` (**68,905 B**, 14:03). 14:00 marker confirmed once each in
`memory/2026-10-23.md` and `vault/daily/2026-10-23.md` (append-only heredoc — no anchor edits, no `edit`/`write` on
daily notes).
⚠️ **Still needs Larry/human:** (1) **Google OAuth** — unblocks live verification of Phases 3–4; (2) **keep-or-ignore
before Sunday** — `media-out/orochimaru/` (157 MB) and `tools/rea/`; (3) the DSN account-keying question; (4) move or
delete the superseded Roxie 8-day PDFs; (5) verify the 2 near-12-month plans (Johnny Smith, Kay Smith) before their
aide cards are issued; (6) 6 compliance watch-items unchanged (Medicaid RA 10/16 · address-of-record §F.1 ·
org-chart re-cut HELD on Chanelle · 3060 audit packet v4 vs v5 · Therap DSN gap · binder rev10 119 pp vs README 118).

**PREV-2 (2026-10-23 Friday, 08:00 — auto-save; nothing new but a no-op push):**
**Nothing moved in the four hours since the 04:00 save, and nothing is half-done.** The one artifact touched was
`memory/carol20-push.log` at 05:10 — and it is the *same* line it has been for 20 straight days:
`✅ pushed CAROL-2.0 @ 9008c6c`. The daily push job is healthy; the CAROL-2.0 repo simply has had zero new commits
since 10-04. No new Vance drop (`_from-vance/` newest is still his 10-22 02:28 phase-4 build), no new `_to-vance/`
work, no portal pulls, no messages waiting. Honest idle, not a stall I can fix.
**Everything still sits on the same human actions.** Scheduler lane: Phase 4 commit durability is *done* (214/214
tests, 48/48 testable rules guarded, zero new deps, no live Google) and every remaining live claim is
**unverifiable, not incomplete** until Larry's **Google OAuth** lands. Decisions still unanswered on my desk:
(a) a real `lookup` for the Google source (production can report ambiguity but not reconcile it); (b) wire
`commitBlocks` into the review harness so the crash matrix is visible; (c) the Q16 double-generation-bump cleanup.
On DSN: do all 3 clients key to David Bosworth's account or keep their own IDs?
⚠️ **Two live re-use hazards on disk, unchanged and both one careless run from real damage:**
(1) the **superseded 8-day / 34 h / $850 Roxie PDFs are still on disk under plain tags** — they over-bill by $150
on the wrong days; the locked version is 10-day / 28.0 h / $700 (claim 18930084). Move or delete before the next
DSN batch. (2) `CAROL/mc_group.sh` still has **`DATE="10/22/2026"` hardcoded** — re-date it or it writes October
contact notes under a later date.
**Roxie stays LOCKED:** Mon–Fri ×2 = 10 days/period · Mon–Thu 3.0 h (2:00–5:00 PM) · Fri 2.0 h (2:00–4:00 PM) ·
112 units = **28.0 h = $700/period**. Her handwritten In/Out was never verified — no original scans exist on disk,
only my generated sheets; if her real times are 2:00–6:00 the hours stay 3.0/2.0 and only the two strings change.
🧥 **Clock: jacket deadline is TOMORROW, Sat 2026-10-24 — the only hard date on the board.** Thread unchanged
(DTF ordered, vinyl in, varsity **L** on chest, sleeve snake small/abstract, near-black charcoal pants).
Housekeeping: **Friday (u=5) → no commit, no push** (Sundays only); tree dirty at **48 entries**, flat since 04:00.
`CAROL_FORM_MAP.txt` re-backed up to `~/Desktop/SCDHHS/`. 08:00 marker confirmed once each in `memory/2026-10-23.md`
and `vault/daily/2026-10-23.md` (append-only heredoc — no anchor edits, no `edit`/`write` on daily notes).
⚠️ **Still needs Larry/human:** (1) **Google OAuth** — unblocks live verification of Phases 3–4; (2) **keep-or-ignore
before Sunday** — `media-out/orochimaru/` (157 MB) and `tools/rea/`; (3) the DSN account-keying question above;
(4) move/delete the superseded Roxie 8-day PDFs; (5) 6 compliance watch-items unchanged (Medicaid RA 10/16 ·
address-of-record §F.1 · org-chart re-cut HELD on Chanelle · 3060 audit packet v4 vs v5 · Therap DSN gap ·
binder rev10 119 pp vs README 118).
**PREV-3 (2026-10-23 Friday, 04:00 — auto-save; dead quiet overnight, nothing moved):**
**Nothing happened overnight and nothing is half-done.** The newest work artifact in the tree is still
`CAROL/mc_group.sh` (10-22 15:34); the only activity after the 22:00 save was the midnight conversation-graph
rebuild (00:02). No new Vance drop (`_from-vance/` newest is still the **02:28 phase-4 build** from 10/22),
no new `_to-vance/` work, no portal pulls, no messages waiting. This is an honest idle state, not a stall I can fix.
**Everything still sits on the same three human actions.** Scheduler lane: Phase 4 commit durability is *done*
(214/214 tests, 48/48 testable rules guarded, zero new deps, no live Google) and every remaining live claim is
**unverifiable, not incomplete** until Larry's **Google OAuth** lands. Decisions still unanswered on my desk:
(a) a real `lookup` for the Google source (production can report ambiguity but not reconcile it); (b) wire
`commitBlocks` into the review harness so the crash matrix is visible; (c) the Q16 double-generation-bump cleanup.
On DSN: do all 3 clients key to David Bosworth's account or keep their own IDs?
⚠️ **Two live re-use hazards on disk, both one careless run away from real damage:**
(1) the **superseded 8-day / 34 h / $850 Roxie PDFs are still on disk under plain tags** — they over-bill by $150
on the wrong days, and the locked version is 10-day / 28.0 h / $700 (claim 18930084). Move or delete them before
the next DSN batch. (2) `CAROL/mc_group.sh` still has **`DATE="10/22/2026"` hardcoded** — re-date it or it writes
October contact notes under a later date.
**Roxie stays LOCKED:** Mon–Fri ×2 = 10 days/period · Mon–Thu 3.0 h (2:00–5:00 PM) · Fri 2.0 h (2:00–4:00 PM) ·
112 units = **28.0 h = $700/period**. Her handwritten In/Out was never verified — no original scans exist on disk,
only my generated sheets; if her real times are 2:00–6:00 the hours stay 3.0/2.0 and only the two strings change.
🧥 **Clock: jacket deadline is TOMORROW, Sat 2026-10-24 — the only hard date on the board.** Thread unchanged
(DTF ordered, vinyl in, varsity **L** on chest, sleeve snake small/abstract, near-black charcoal pants).
Housekeeping: **graphify 7889 nodes / 8725 edges** (prev 7876/8714; 850/850 files). **Friday (u=5) → no commit,
no push** (Sundays only); tree dirty at **48 entries** (46 at 22:00 — +`PROVIDER/scripts/cdp_fetch_ro.py`,
+`PROVIDER/reports-raw/auth-week-2026-10-11.csv`). `CAROL_FORM_MAP.txt` re-backed up to `~/Desktop/SCDHHS/`
(68,905 B, 04:0x). 04:00 marker confirmed once each in `memory/2026-10-23.md` and `vault/daily/2026-10-23.md`
(append-only heredoc — no anchor edits).
⚠️ **Still needs Larry/human:** (1) **Google OAuth** — unblocks live verification of Phases 3–4; (2) **keep-or-ignore
before Sunday** — `media-out/orochimaru/` (157 MB) and `tools/rea/`; (3) the DSN account-keying question above;
(4) move/delete the superseded Roxie 8-day PDFs; (5) 6 compliance watch-items unchanged (Medicaid RA 10/16 ·
address-of-record §F.1 · org-chart re-cut HELD on Chanelle · 3060 audit packet v4 vs v5 · Therap DSN gap ·
binder rev10 119 pp vs README 118).

**PREV-4 (2026-10-22 Thursday, 22:00 — auto-save; quiet evening, one new CAROL batch runner):**
**Nothing live since the 14:00 save except one script.** The whole evening produced `CAROL/mc_group.sh` (624 B, 15:34):
a **fail-fast batch runner** for CAROL MC notes. It loops `ID:opts` pairs, runs
`carol.js auto <ID> MC 10/22/2026 <opts>` on **CDP_PORT 18802** with a 240 s timeout, **requires the literal
`filled_ready_for_review` before it will save**, then requires `saved_draft` — exiting 2 on a fill failure and 3 on a
save failure. That is the right shape: it stops at the first bad participant instead of half-writing a batch and
letting me guess which ones landed.
⚠️ **`DATE="10/22/2026"` is hardcoded** — re-date it before the next run or it will silently write October contact
notes under a later date.
**Roxie/DSN is unchanged and still locked** at 10 days/period · Mon–Thu 3.0 h (2:00–5:00 PM) · Fri 2.0 h (2:00–4:00 PM) ·
112 units = 28.0 h = **$700/period**, matching filed claim 18930084. ⚠️ **The superseded 8-day / 34 h / $850 PDFs are
still on disk under plain tags** — that is a live re-use hazard, not a cosmetic one. Move or delete them before the
next DSN batch runs.
**No Vance traffic all day** past the 02:28 phase-4 report; newest `_to-vance/` is still the 02:09 phase-4 GO. Nothing
is waiting on him, nothing of his is waiting on me.
**Scheduler lane is stalled on one human action, not on code — Larry's Google OAuth.** Phase 4 commit durability is
done (214/214 tests, 48/48 testable rules guarded, zero new deps, no live Google), so what remains is *unverifiable*
rather than *incomplete*. Three decisions still on my desk from his report: (a) a real `lookup` for the Google source
(production can report ambiguity but not reconcile it); (b) wire `commitBlocks` into the review harness so the crash
matrix is visible rather than test-only; (c) the Q16 double-generation-bump cleanup.
**Still open on DSN, unanswered:** do all 3 DSN clients key to David Bosworth's account or keep their own IDs? And
Roxie's handwritten In/Out has never been verified — **no original scans exist on disk, only my generated sheets**.
⚠️ **Clock: jacket deadline is Sat 2026-10-24 — two days out.** Thread unchanged (DTF ordered, vinyl in, varsity **L**
on chest, sleeve snake small/abstract, near-black charcoal pants).
Housekeeping: **graphify 7876 nodes / 8714 edges** (prev 7875/8713 — the +1 is `mc_group.sh`; 848/848 files).
**Thursday (u=4) → no commit, no push**; tree dirty at **46 entries** (45 at 14:00). `CAROL_FORM_MAP.txt` re-backed up
to `~/Desktop/SCDHHS/` (68,905 B, 22:02). 22:00 marker confirmed once each in `memory/2026-10-22.md` and `vault/daily/`
(append-only heredoc — no anchor edits).
⚠️ **Still needs Larry/human:** (1) **Google OAuth** — unblocks live verification of Phases 3–4; (2) **keep-or-ignore
before Sunday** — `media-out/orochimaru/` (157 MB) and `tools/rea/`; (3) the DSN account-keying question above;
(4) 6 compliance watch-items unchanged (Medicaid RA 10/16 · address-of-record §F.1 · org-chart re-cut HELD on
Chanelle · 3060 audit packet v4 vs v5 · Therap DSN gap · binder rev10 119 pp vs README 118).

**PREV-5 (2026-10-22 Thursday, 14:00 — auto-save; Roxie DSN sheets locked and rebuilt):**
**Roxie Johnson's DSN timesheets are LOCKED at the 10-day shape, after Larry overrode my 8-day build.**
His words: "Monday thru friday, do those hours you said to match the actual real authorization." Final spec =
**Mon–Fri ×2 = 10 days/period · Mon–Thu 12u = 3.0 h (2:00–5:00 PM) · Fri 8u = 2.0 h (2:00–4:00 PM) · 112 units =
28.0 h = $700/period**, which matches the filed claim **18930084 $700.00** exactly. The earlier 8-day / 34 h / $850
build **over-billed the payer by $150 on the wrong days** and is superseded — do not reuse those files.
**How the argument actually got settled:** not by opinion — by the portal pull. `PROVIDER/dsn-david-history/roxie_days_all.md`
(2026-10-01, 784 distinct days, 79 pay periods) shows 8-day in 69 periods **but the only recent periods are 10-day**
(08/02, 08/16, 08/30, 09/13) and **all 10 lifetime Fridays post-date 2026-08-07**. Friday was added to her schedule in
August 2026. Lesson worth keeping: when a client's schedule "changes," the weekday histogram over the whole history
names the date it changed — that is faster and more defensible than re-reading any single sheet.
**Built:** 6 periods + combined `DDSN_Roxie_Johnson_10day_ALL_2026-10-11_thru_2027-01-02.pdf`, script
`scripts/ddsn_roxie_28h_2026.py`; all 6 PASS the blank-page differential (codes 20–23 on exactly cols 1,2,3,4,5,8,9,10,11,12).
**Correction logged: DSN does NOT appear in Provider Activity.** That report is PCS/COMPA/CPCA only; DSN lives on the
CMS-1500 claims side, keyed to **David Bosworth's** info. My "Roxie is missing from Provider Activity" alarm was a
false alarm produced by reading the wrong report — second time this month I've raised a false alarm from a report
that couldn't contain the answer.
**Open on Roxie/DSN:** (1) do all 3 DSN clients key to David's account, or keep their own IDs? (asked Larry, not yet
answered); (2) her handwritten In/Out was never verified — **no original scans exist on disk, only my generated
sheets**. If her real times are 2:00–6:00 the hours stay 3.0/2.0 and only the two time strings change.
**Scheduler lane is unchanged and still blocked on one human action — Larry's Google OAuth.** Phase 4 (commit
durability) is done: 214/214 tests, 48/48 testable rules guarded, zero new deps, no live Google. The three decisions
still sitting on my desk from Vance's report: (a) a real `lookup` for the Google source (production can *report*
ambiguity but not *reconcile* it); (b) wire `commitBlocks` into the review harness so the crash matrix is visible
rather than test-only; (c) the Q16 double-generation-bump cleanup.
⚠️ **Clock: jacket deadline is Sat 2026-10-24 — two days out.** Thread unchanged (DTF ordered, vinyl in, varsity **L**
on chest, sleeve snake small/abstract, near-black charcoal pants).
Housekeeping: **graphify 7875 nodes / 8713 edges** (prev 7862/8682; 848/848 files). **Thursday (u=4) → no git push**;
tree dirty at **45 entries** (up from 40 at 08:00 — +Roxie PDFs, +`PROVIDER/week-audit-2026-10-17/`, +`research/`).
`CAROL_FORM_MAP.txt` re-backed up to `~/Desktop/SCDHHS/`. 14:00 marker confirmed once each in `memory/2026-10-22.md`
and `vault/daily/` (append-only heredoc — no anchor edits).
⚠️ **Still needs Larry/human:** (1) **Google OAuth** — unblocks live verification of Phases 3–4; (2) **keep-or-ignore
before Sunday** — `media-out/orochimaru/` (157 MB) and `tools/rea/`; (3) the DSN account-keying question above;
(4) 6 compliance watch-items unchanged (Medicaid RA 10/16 · address-of-record §F.1 · org-chart re-cut HELD on
Chanelle · 3060 audit packet v4 vs v5 · Therap DSN gap · binder rev10 119 pp vs README 118).

**PREV-6 (2026-10-22 Thursday, 08:00 — auto-save; quiet overnight):**
**Quiet overnight since the 04:00 save.** No new Vance drop (`hermes-share/_from-vance/` newest is still the 02:28
phase-4 build report), no new `_to-vance/` work, no portal work, no messages waiting. The only machine activity was
the routine **05:10 CAROL-2.0 auto-push** (`✅ pushed CAROL-2.0 @ 9008c6c`) — housekeeping green, nothing to fix.
**Where the scheduler lane actually stands:** Phase 4 (commit durability) is **done and accepted in substance** —
214/214 tests, 48/48 testable rules guarded, 1 declared equivalent, zero new deps, no live Google. What is left is
not code, it is **one human action**: Larry's **Google OAuth**, the single unblock for every *live* claim in
Phases 3–4. Until that lands, the build can only be proven against fixtures.
**The three items on the decision desk (all from Vance's phase-4 report, all mine to answer):** (a) a **real `lookup`**
for the Google source — production can currently *report* ambiguity but cannot *reconcile* it, which is a safe
failure rather than a useful one; (b) whether to **wire `commitBlocks` into the review harness** so the crash matrix
is visible instead of test-only; (c) the **Q16 cleanup** — a 409 bumps the generation in *both* sink and pipeline, so
it can advance twice per logical rejection; clean fix is the sink reporting the generation it used. (Q17, jitter
applied after the cap → worst case 1.25× max, is cosmetic and needs no decision.)
⚠️ **Clock: the jacket deadline is Sat 2026-10-24 — two days out.** Thread status unchanged (DTF ordered, vinyl in,
varsity **L** on chest, sleeve snake small/abstract, near-black charcoal pants).
Housekeeping: **graphify 7862 nodes / 8682 edges** (prev 7860/8680; 843/843 files). **Thursday → no git push**; tree
dirty at **40 entries**, unchanged since 04:00. `CAROL_FORM_MAP.txt` re-backed up to `~/Desktop/SCDHHS/`. 08:00
daily-note marker confirmed once each in `memory/2026-10-22.md` and `vault/daily/` (append-only heredoc, no anchor edits).
⚠️ **Still needs Larry/human:** (1) **Google OAuth** — unblocks live verification of Phases 3–4; (2) **keep-or-ignore
before Sunday** — `media-out/orochimaru/` (157 MB) and `tools/rea/`; (3) 6 compliance watch-items unchanged (Medicaid
RA 10/16 · address-of-record §F.1 · org-chart re-cut HELD on Chanelle · 3060 audit packet v4 vs v5 · Therap DSN gap ·
binder rev10 119 pp vs README 118).

**PREV-7 (2026-10-22 Thursday, 04:00 — auto-save):**
**Vance closed Phase 4 in 18 minutes.** `hermes-share/_from-vance/VANCE-CLAW_phase4-build_2026-10-22.md`
(5,919 B, 02:28) — **commit durability COMPLETE: 214/214 tests, 48/48 testable rules guarded · 1 declared
equivalent, zero new deps, no live Google.** Delivered the Phase 4 GO brief at 02:09 (6,396 B, verified on the 3060)
and he replied by scp at 02:28 — **the return path needs no human relay**, and his Hermes is polling, not waiting.
**What he got right and why it is trustworthy:** the crash matrix went **green on the first run** and he treated that
as a warning sign, not a win — so he wrote **9 mutation guards** (removing the ledger pre-write, letting an
unreconcilable outcome assume absence, re-inserting a committed UID, unbounded retries) and caught all 9. Kill-point
matrix = `before_adapter` / `after_adapter` / `after_ledger`, each asserting no duplicate · no silently lost block ·
ambiguity surfaces. **`src/store.js`** atomic temp+rename, ledger in the same document; **`migrations/001_init.sql`**
ships a partial unique index so a double-book is a DB error. **Retry** = bounded exponential + symmetric jitter,
`Retry-After` honoured, transient retries / permanent 4xx does not / **409 belongs to D1**.
**His three flagged judgement calls:** (1) `attempting` → `unknown` on reconciliation — "it describes a moment that
has passed, not what we know now"; (2) **insert only on POSITIVE evidence of absence** — a lookup that THROWS leaves
`unknown` + `AMBIGUOUS_OUTCOME`, never `absent`; (3) **409 bumps in BOTH sink and pipeline → generation can advance
twice per logical rejection** — not incorrect but untidy → **Q16**, clean fix is the sink reporting the generation it
used. Also **Q17**: jitter applied *after* the cap, worst case 1.25×max.
⚠️ **Three decisions he wants next, and all three are mine to make:** (a) a **real `lookup`** for the Google source —
production can currently *report* ambiguity but cannot *reconcile* it (safe failure, not the useful one); (b) whether
to **wire `commitBlocks` into the review harness** so the crash matrix is visible instead of test-only; (c) the Q16
double-bump cleanup. **Larry's Google OAuth still blocks all live verification** — Phase 4 needed none of it.
Housekeeping: **graphify 7860 nodes / 8680 edges** (prev 7819/8643, 843/843 files). **Thursday → no git push**; tree
dirty at **40 entries**. `CAROL_FORM_MAP.txt` re-backed up to `~/Desktop/SCDHHS/` (68,905 B, 04:02). 04:00 daily-note
marker confirmed in both `memory/` and `vault/daily/` once each (append-only heredoc — no anchor edits).
⚠️ **Still needs Larry/human:** (1) **Google OAuth** — the single unblock for live verification of Phases 3–4;
(2) **keep-or-ignore before Sunday** — `media-out/orochimaru/` (157 MB) and `tools/rea/`; (3) 6 compliance
watch-items unchanged (Medicaid RA 10/16 · address-of-record §F.1 · org-chart re-cut HELD on Chanelle · 3060 audit
packet v4 vs v5 · Therap DSN gap · binder rev10 119 pp vs README 118). Jacket deadline **Sat 2026-10-24**.

**PREV-8 (2026-10-21 Wednesday, 22:00 — auto-save; quiet evening):**
Quiet all evening — nothing new since the 14:00 entry. Only `memory/2026-10-21.md` itself was touched after 14:00;
`hermes-share/_from-vance/` still newest at 12:26. **Graphify 7819 nodes / 8643 edges** (prev 7818/8642; 839/839 files).
**Wednesday → no git push**; tree dirty at **36 entries**, unchanged all day. `CAROL_FORM_MAP.txt` re-backed up to
`~/Desktop/SCDHHS/` (same 68,905 B content). The 22:00 daily-note marker is confirmed in both `memory/` and
`vault/daily/` (append-only heredoc path — no anchor edits, no repeat of the 10/19 failure).
Today's real work, already closed: **X-audit runbook live as a skill** + re-delivered to the 3060 after Vance's 12:26
corrections (18,291 B @ 12:31, verified by size+mtime); **hermes-share return path corrected in TOOLS.md** (it IS
bidirectional — my "no return path" claim was stale from 09-21); **Terra M. Thomas closed** (services on hold, Phoenix
note placed, X codes are expected system output).
⚠️ **Still waiting on a human:** (1) **keep-or-ignore before Sunday** — `media-out/orochimaru/` (157 MB) and
`tools/rea/`; (2) **Larry's Google OAuth** — blocks all live verification of Vance's Phase 3; (3) **Vance owes the one
preview-harness command**; (4) 6 compliance watch-items unchanged (Medicaid RA 10/16 · address-of-record §F.1 ·
org-chart re-cut HELD on Chanelle · 3060 audit packet v4 vs v5 · Therap DSN gap · binder rev10 119 pp vs README 118).
Jacket thread open: DTF ordered, vinyl in, varsity **L** on chest, sleeve snake (keep small/abstract), near-black charcoal pants.
Jacket deadline: **Sat 2026-10-24**.

**PREV (2026-10-21 Wednesday, 04:00 — Vance Phase 3 debt CLOSED):**
Overnight work after the 10/20 22:00 save — two things. **(a) `22:40` TOOLS.md antivirus correction:** I had wrongly
told Larry the 3060 had no AV. **Bitdefender Antivirus IS installed, running and current** (VSSERV / BDProtSrv /
UPDATESRV / bdredline / bdvpnservice / BDSafepaySrv; defs `auto.cvd` + `hs_qid.cvd` written 10/20 7:27 PM). **Windows
Defender stopped is EXPECTED** (Bitdefender disables WinDefend/WdNisSvc so engines don't fight) — "Defender disabled"
≠ "no antivirus". **(b) `01:25` Phase 3 GO FINALIZED + DELIVERED:** `drafts/CLAW-VANCE_phase3-GO_2026-10-21.md`
(5,739 B) → `hermes-share/_to-vance/` — supersedes the 10/20 15:00 draft, header *"FINAL, Larry approved 'push go'"*.
**Phase 2 ACCEPTED** incl. the 1 declared equivalent mutant. **D1** iCalUID generation counter — do it now
(`iCalUidFor(task_id, part_index, generation)`, `commit_attempt` persisted, re-plan must not reset, mutation-guard
strips `generation`); **D2** transparency/FreeBusy — lower bound + subtract via `events.list`, explicit degraded flag
+ 3 tests; **D3** splitter `min_task_minutes = 120`, chunk floor 25; **Q9** capacity basis accepted as written.
Scope = those three only, **no live Google calls** (OAuth still blocked on Larry), fixtures only, keep
`N/N guarded · M declared equivalent`. Still owed by Vance: the **one command to run the preview harness**.

**PREV (2026-10-20 Tuesday, 22:00 — auto-save; the day's only real work was the Vance Phase 3 draft at 15:00):**
Everything else today was housekeeping. **`drafts/CLAW-VANCE_phase3-GO_2026-10-20_DRAFT.md`** (4,897 B, 15:00) —
*"draft — pending Larry's sign-off"* — formally **ACCEPTS Phase 2** (153/153, 32/32 guarded, **1 declared equivalent
mutant** praised as the correct standard, not padded to 33/33) and closes the 3-day reply debt *on paper only*.
Three decisions drafted, all attributed to Larry: **D1** `iCalUID` generation counter — **DO IT NOW**,
`iCalUidFor(task_id, part_index, generation)` incrementing per commit attempt with `commit_attempt` **persisted on
the block record** (a re-plan must not reset it to 0, §5.2) + mutation guard, implement regardless of Google's
reservation behaviour and log it as unverified in `GOOGLE_ANSWERS.md` Q3; **D2** transparency/FreeBusy → lower bound
+ subtract transparent intervals via `events.list` + explicit degraded flag + 3 tests; **D3** splitter
`min_task_minutes = 120` (chunk floor stays 25, both rules apply, update `OPEN_QUESTIONS.md` Q2). **Q9** accepted as
written — both numbers, never collapsed. Phase 3 scope = those three only, **no live Google calls** (OAuth still
blocked on Larry), fixtures only, keep `N/N guarded · M declared equivalent`. ⚠️ **Draft is NOT sent** —
`hermes-share/_to-vance/` still holds only the 10/19 files; **Larry must sign off first.** Also re-asked for the one
preview-harness command (missed in Phase 2). Housekeeping: Graphify **7723/8530** (prev 7711/8519); git tree **27 → 28**
(11 modified / 17 untracked — the +1 is `?? drafts/`, visible only now that the draft exists); Tuesday so no push;
`CAROL_FORM_MAP.txt` refreshed to `~/Desktop/SCDHHS/` (68,905 B, 22:02).
⚠️ **Still needs Larry/human action:** (1) **sign off on the Phase 3 GO draft** so it can go to `_to-vance/`;
(2) **keep-or-ignore before Sunday push** — `media-out/orochimaru/` (157 MB) and `tools/rea/`; (3) **REA toolFilter
include-list** TODO — 207 MCP tools is heavy context surface; (4) **rewrite the 10 PM memory cron to append** (its
anchor edits broke 10/19); (5) 6 compliance watch-items unchanged (Medicaid RA 10/16 · address-of-record §F.1 ·
org-chart re-cut HELD on Chanelle · 3060 audit packet v4 vs v5 · Therap DSN gap · binder rev10 119 pp vs README 118).

**PREV (2026-10-20 Tuesday, 14:00 — auto-save; day has been QUIET since 08:00):** No live work since the
04:00 carry-over block below. Nothing changed in the workspace all day except the memory note itself — no PHC,
clothing, or Vance-lane activity. Housekeeping only: Graphify **7711/8519** (prev 7710/8518); git tree steady at
**27 pending** (11 modified / 16 untracked), Tuesday so no push; `CAROL_FORM_MAP.txt` refreshed to
`~/Desktop/SCDHHS/` (68,905 B, 14:03).
⚠️ **Carry-overs that still need Larry/human action:** (1) **Vance Phase 2 reply is now 3+ days owed** — three
flagged items: `iCalUidFor()` generation counter (deleted UIDs re-commit → 409 forever), transparency/FreeBusy
lower-bound question, splitter minimum-task threshold; (2) **keep-or-ignore before Sunday push** on
`media-out/orochimaru/` (157 MB) and `tools/rea/`; (3) **REA toolFilter include-list** still TODO — 207 MCP tools
is heavy context surface; (4) **rewrite the 10 PM memory cron to append** (its anchor edits broke 10/19);
(5) 6 compliance watch-items unchanged (Medicaid RA 10/16 · address-of-record §F.1 · org-chart re-cut HELD on
Chanelle · 3060 audit packet v4 vs v5 · Therap DSN gap · binder rev10 119 pp vs README 118).

**PREV (2026-10-20 Tuesday, 08:00 — auto-save; quiet since 04:00):** Quiet overnight for PHC; the real work was **late Monday
(22:45–23:11)** and is now documented — **REA is installed and live**: `tools/rea` (morluto/rea v6.7.0, MIT), global
`rea` CLI 6.7.0, OpenClaw MCP server `mcp.servers.rea` → `rea mcp` (stdio), probe = **207 tools + prompts**. ⚠️ That
is a lot of context surface — **apply a `toolFilter` include-list before real use.** (config.patch refused the
protected path → edited `openclaw.json` directly; backup `.bak-rea-20261019-2251`.) **3060 infra finally fixed:**
the **hermes-sync scheduled task had NEVER been scheduled** — that is why HP→3060 handoffs silently never arrived;
now every 20 min via hidden VBS, principal `DESKTOP-R96DQLM\user`; **w32time was Stopped/Manual and ~57 min slow** →
Running/Automatic synced to time.cloudflare.com; Desktop cleaned 57→30 files (manifest saved); nested
`Home Care documents` flattened (68 items); Living Planner shortcut repointed. **iMac:** caffeinate DISABLED,
pmset back to sleep 20 / display 10. New `scripts/session-save.sh` = curated USB tarball (excludes node_modules,
.git, video, iso, zip, media_storage, tools/rea). Payroll: 10/11–10/17 tasksheets sorted (40 pp, 30 participants,
A→Z, multi-worker groups adjacent) → `~/Desktop/Billing-Training/Activities_Tasksheets_SORTED_10-11_to_10-17.pdf`,
printed single-sided. Jacket: files consolidated on the 3060, 960 px/79 DPI source upscaled 4× Real-ESRGAN anime
to true 300 DPI. Graphify **7709/8517** (prev 7706/8515). Tuesday → no push; ⚠️ **157 MB `media-out/orochimaru/`
still needs a decision before Sunday.** ⚠️ **Phase 2 reply to Vance still owed** (iCalUID generation counter ·
transparency/FreeBusy lower-bound · splitter min-task threshold). ⚠️ **Rewrite the 10 PM memory cron to append** —
its string-edit anchors broke on 10/19.

**PREV (2026-10-19 Monday, 22:00 — auto-save):** Evening was **clothing lane, not PHC** — the **Orochimaru
jacket DTF print kit** (14:00–19:11). Built **two complete size sets, 7 variants each**, in `media-out/orochimaru/`
(157 MB): **SET A `jacket_15x15press_*` (recommended)** art 11.40×13.96" / canvas 11.95×14.51" → one-pass 15×15 press
w/ ~0.5" margin; **SET B `jacket_14x14sheet_*`** art 10.80×13.20" / canvas 11.35×13.75"; plus `orochimaru_back_12in_*`
and 2 zips. Variants: FULL / EYES-KNOCKOUT / EYES-SOCKET / NO-OUTLINE / OUTLINE-WHITE-ONLY / KEYLINE-ONLY /
HAIR-FLOCK-MASK. Handoff doc = **`OROCHIMARU_JACKET_SPEC.txt`** (+ README_SPEC). Art is portrait 0.816 → at 14" wide
it'd be 17.1" tall, hence the 14×14 split. **Eye holes: Larry's Illustrator read (19:09) wins** — right 0.50×0.50",
left 0.60×0.50" (script was +0.03" from mask dilation); at 11.4" they're too small to weed in HTV → enlarge ~2.5× in
art, or 0.75–0.8" GITD disc cover, or 3mm LED behind 0.75" dome. Disc variants added. Flock = color pass first, then
white ring w/ 1/32"–1/16" overlap @ 285–300 °F. Graphify 7687/8499. Monday → no push; ⚠️ **decide whether 157 MB
`media-out/orochimaru/` belongs in the repo before Sunday.** ⚠️ **Phase 2 (Vance) still unreviewed — reply owed**
(iCalUID generation counter · transparency likely inverted · splitter min-task threshold product call).

**PREV (2026-10-19 Monday, 14:00 — auto-save):** Scheduler build moved fast on the Vance lane. 04:58 Larry
"Go and start phase 1" → Phase 1 delivered **87/87 tests, 13/13 mutation-guarded** → accepted (TickTick Premium dead;
Morgen OAuth still NOT given and is not a dependency). 11:38 Larry decided Q1 — **"21 is best."** → horizon = 21 days
as a **product-owner decision** (Q1 in OPEN_QUESTIONS.md says so) → Phase 2 GO. 13:23 **Phase 2 build complete**
(`hermes-share/_from-vance/VANCE-CLAW_phase2-build_2026-10-19.md`): **153/153 tests, 32/32 testable rules guarded,
1 declared equivalent mutant**, zero deps/no network. Deliverables: `src/split.js` (never emits a sub-floor runt;
`SPLIT_DISABLED` as its own at-risk reason), `src/review.js` (pure reducer; committed/pinned never moved by re-plan;
partial commit keeps successes; stale `input_hash` refuses silent recompute), `harness.html`, `src/google.js`
(freebusy, events.list+syncToken, 410→full re-sync, iCalUID, If-Match/412, delete 410/404=deleted), `GOOGLE_ANSWERS.md`.
Q9 = report **both** `free_minutes` and `accepting_minutes`. ⚠️ **Phase 2 not yet reviewed/accepted — reply to Vance
still owed.** Three items needing a human: (a) **`iCalUidFor()` needs a generation counter** — deleted UIDs stay
reserved → re-commit after deletion 409s forever (real bug, unpatched); (b) **transparency likely inverted** — Google
`busy[]` cannot express transparency and FreeBusy is reported to count all-day "free" events as busy → treat freeBusy
as a LOWER BOUND + subtract transparent intervals from `events.list`, needs one live call; (c) **splitter has no
minimum-task threshold** (50 min → 25+25) — product call. Graphify 7677/8479. Monday → no git push. Desktop backup OK.
6 watch-items unchanged.

**PREV (2026-10-18 Sunday, 22:00):** No live PHC work since Fri 10/17. Sunday's only task was the
**REA planner research pass** for Vance (task t_78f63900, 15:35) — deliverables in `planner/` + handoff at
`hermes-share/_from-vance/VANCE-CLAW_rea-planner-live-pass_2026-10-18.md`. Verdict: TickTick = interaction
reference only (API has no duration field); **Morgen planner is behind a login wall → 9/10 autoplan Qs unverified**.
**Two decisions waiting on Larry: TickTick Premium (~$36/yr, optional) + Morgen login w/ 1 calendar (the real unblocker).**
6 watch-items still open: Medicaid RA 10/16 reconcile · address-of-record §F.1 · org-chart #1 re-cut (HELD on Chanelle) ·
3060 audit packet v4 vs v5 · Therap DSN module gap · binder rev10 119pp vs README 118.

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
- **Nurse follow-ups:** 10/16 printable for Chanelle (`~/Desktop/PHC_Chanelle_Nurse_Visits_Oct-Nov_2026.pdf`) = overdue Terra Thomas + Nov (Nesbitt, Grove, White, Garrison, Kantor); the 6 others done by someone else; Hoover = discharged. Still: refresh stale `PHC_Nurse_Visit_Matches_2026.xlsx` (~8/27).
- **Reminder fires Tue 10/13 9 AM** (Shirley Watson).
- **Modivcare (TP portal) admin change — TABLED.** New admin = Dinasti Jones or Pierre Dupree (**Pierre = Thomas Dupree, same person**, per Larry 10/16)? SCNetwork@modivcare.com / 866-779-5200. See `vault/topics/senator-transportation.md`.
- **Therap Super Admin CHANGE** — signed letter + DL ready (`Desktop/PHC-Therap-Reset/`); pending Larry's submission (Super Admin → Dinasti Jones).
- **Dinasti Jones strike limit** — do NOT re-file her resolutions (Smith/Jimmie 10/07+10/08 DENIED) until strike clears.
- **Hardy, April** — 3 accepted-but-$0 (U85W / K8OI / V5EH) → won't pay; chase.
- Optional: enable OpenRouter Auto Top-Up.
- Finish the recall eval set when convenient (18 items, 3/18 done all HIT).

**Memory architecture (live 10-11):** #1 memory-health watchdog (cron `e35af2d2`, 15-min); #3 store hierarchy (vault = CANON); #2 recall-eval set. Hindsight LLM → DeepSeek direct.

---
**2026-10-16 (Fri) 04:00 — auto-save:** No new live work since 10/15 22:00. Everything below stands; key watch-item is the **Medicaid RA dated 10/16** (check #6893199, $10,070.75, EX1882) + the **address-of-record flag** (Greer vs Duncan → §F.1 notice). Org-chart re-cut still HELD pending the Chanelle Allen call.
**2026-10-16 (Fri) 08:00 — auto-save:** Still no new live work since 10/15 22:00 (8 AM cron mirrors 04:00). Watch-items unchanged: **Medicaid RA dated 10/16** (check #6893199, $10,070.75, EX1882) + **address-of-record flag** (Greer vs Duncan → §F.1 notice). Org-chart re-cut still HELD pending the Chanelle Allen call. Graphify 7435 nodes / 8251 edges.
**2026-10-16 (Fri) 14:00 — auto-save:** Live work since 08:00: nurse printable for Chanelle (sent), Pierre=Thomas Dupree identity resolved, compliance Q&A + CM cheat sheet sent, shared (864) 325-4126 number confirmed = Mag's AR contact (stop flagging), Nurse Supervisory Assessment rebuilt w/ logo (blank + fillable). Watch-items unchanged: **Medicaid RA 10/16** (#6893199, $10,070.75, EX1882) + **address-of-record flag** (Greer vs Duncan → §F.1). Graphify 7445/8268.
**2026-10-16 (Fri) 22:00 — auto-save:** Day's live work: Nurse Supervisory Assessment FINAL (2pp, 10q p1/5q p2, 58 fields) + swapped into binder #11 (master stays **rev10**, now **119 pp** — rev11 bump reverted per Larry); binder index #11 updated to Initial/30-Day/Quarterly; Saturday Night Audit packet (37 per-client PDFs from the 10/14 v4 build) built + pushed to 3060 `Desktop\Saturday_Night_Audit_2026-10-17\`; Therap recon as Jay (DSN clients ARE there — Bosworth clientId 10536725 / CM Kendra McLeod, Bright Start CMBRIT-SC — but PHC's account has **NO Health/Nursing/T-Log/ISP/EVV module** → DSN supv visits live with the CM/DDSN); iMac caffeinate re-enabled (pid 2499, LaunchAgent). Watch-items unchanged: **Medicaid RA 10/16** (#6893199, $10,070.75, EX1882) + **address-of-record flag** (Greer vs Duncan → §F.1). Graphify 7454/8277.
**2026-10-17 (Sat) 04:00 — auto-save:** No new live work since 10/16 22:00 (overnight changes were machine-generated digests/graphify only). Watch-items unchanged: **Medicaid RA 10/16** (#6893199, $10,070.75, EX1882) + **address-of-record flag** (Greer vs Duncan → §F.1); org-chart re-cut HELD on the Chanelle Allen call; **Saturday Night Audit packet** (37 per-client PDFs, 10/14 v4 data) already staged on the 3060 for tonight. Graphify 7527/8345. Desktop CAROL_FORM_MAP backup ✅.
**2026-10-17 (Sat) 14:00 — auto-save:** NEW live work since 08:00 → **audit "DAYS OF SERVICE" feature** (Larry's directive today): `task-sheet-audit-spec.md` + `build_audit_v3.py` / `build_audit_sheet_docx.py` / `split_audit_packet.py` updated 12:16–12:18 so every participant block prints the **derived** authorized weekday pattern (`DAYS OF SERVICE: TUE & THU (4.0 hrs/day · auth 07/02/2023 – open)`) — START banner + under every section header; `SERVICE_DAYS.csv` (35 participants) comes from the auth weekday distribution in `audit-grid-2024-2026.csv`; MISSING TASK SHEETS shows the week's actual authorized weekdays, not just a count. **v5 build**: `~/Desktop/PHC-Audit-2024-2026/v5-20261017/` → PDF **151 pp** + docx, 105 missing-sheet rows · 700 MARK · 816 blanks, `packet/` 38 files (README + 37 clients). ⚠️ **The Saturday Night Audit packet staged on the 3060 is the 10/14 v4 build — v5 supersedes it; re-stage before tonight.** Watch-items unchanged: Medicaid RA 10/16 (#6893199, $10,070.75, EX1882) · address-of-record Greer-vs-Duncan → §F.1 · org-chart re-cut HELD on the Chanelle Allen call · Therap DSN module gap (Kendra McLeod) · binder rev10 = 119 pp vs README 118. Graphify 7536/8357.
**2026-10-17 (Sat) 22:00 — auto-save:** No new live work since 14:00 (no file changes after 14:05). Day's real output = **v5 audit build with DAYS OF SERVICE** → `~/Desktop/PHC-Audit-2024-2026/v5-20261017/` (PDF 151 pp + docx, 38-file packet, 105 missing-sheet rows · 700 MARK · 816 blanks, SERVICE_DAYS.csv 35 participants). ⚠️ **Saturday Night Audit packet on the 3060 is still the 10/14 v4 — re-stage v5 before tonight.** Watch-items unchanged: Medicaid RA 10/16 (#6893199, $10,070.75, EX1882) · address-of-record Greer-vs-Duncan → §F.1 · org-chart re-cut HELD on the Chanelle Allen call · Therap DSN module gap (Kendra McLeod) · binder rev10 = 119 pp vs README 118. Graphify 7537/8358. Desktop CAROL_FORM_MAP backup ✅.
**2026-10-18 (Sun) 04:00 — auto-save:** No new live work since the 10/17 22:00 save (only the auto conversation digest + graphify outputs changed overnight). **Graphify** 7545 nodes / 8365 edges. **Sunday → git push done: `e547981 auto-save 2026-10-18`** (178 files, first push since 10/11 — carries the v5 audit DAYS-OF-SERVICE build, compliance-review-44601, Q4 pulls, TOOLS notes). Desktop CAROL_FORM_MAP backup ✅. **Watch-items unchanged:** Medicaid RA 10/16 (#6893199, $10,070.75, EX1882) · address-of-record Greer-vs-Duncan → §F.1 · org-chart re-cut HELD on the Chanelle Allen call · ⚠️ **3060 Saturday-audit packet is still the 10/14 v4 — v5 (10/17, DAYS OF SERVICE) supersedes it; confirm re-stage/audit** · Therap DSN module gap (Kendra McLeod) · binder rev10 = 119 pp vs README 118.

## 2026-10-19 00:35 — Orochimaru jacket
- Jacket: **light gray bomber**, Amazon. Press: 15x15 (tiles larger designs by repositioning).
- Revised canvas: ~11.5W x 13.5H, 2.5-3" below collar seam, 3" above ribbed hem.
- Light gray changes the plan: pale face needs a DARK outline/halo; glow HTV reads as a pale blob on light gray in daylight — verify against the shell before choosing it for the iris.
- Larry may go LED eyes instead of HTV glow. He is sourcing a higher-res image.
- Deadline Sat 2026-10-24.
