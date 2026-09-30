# Working Context

**Updated:** 2026-09-29 22:00 EDT
**State:** ACTIVE — REV assessment fill (3060 lane)

## NOW (2026-09-29 early AM)
- ✅ **REV ASSESSMENT FILL: Jessica A Hill (9841848) — done.** Larry confirmed protocol = **run as-is** (per-sub S&C subs 1–20, plain save sub 21). `carol_fill_assessment.js 1818120` → subs 1–21 all saved, `✅ Done`. Verified subs 6/16/20. **Sub 22 (Source of Info/LOC/signature) = Larry's.**
- ✅ **ALL 5 REV assessments done + Larry completed & sent emails (3060 lane):** Hill 1818120, Owens 1818121, Pitts 1818122, Jones 1818123, Williams 1818124. Each: subs 1–21 saved, `✅ Done`; **sub 22 left for Larry**. Willie Bunkley (9758825) assessment not yet created/seen.
- ✅ **All 5 REVs done (narratives + assessments) + sent to Acentra (LOC).** QV batch done except **Maria D Gambrell (9845732)**. Tally = 147.
- ✅ **SP done+completed:** John A Williams SP 888411 → tally #148.
- ✅ **SP done+completed:** James S Jones SP 888413 → tally #149.
- ✅ **SP done+completed:** Melinda L Pitts SP 888415 → tally #150. Willie Bunkley (9758825) REV still pending (Larry pings after visit).
- ⚠️ Tunnel (HP:18802→3060:18801) dropped once mid-session; `./tunnel_3060.sh` restart fixed it. Still up (pid 349154).
- Lane: 3060 via tunnel HP:18802→3060:18801 (pid 346183). HP local 18801 down.

## NOW (end of 09-28)
- ✅ **Binder print master = rev8** (`00_PRINT_THIS__COMPLETE_MANUAL_rev8.pdf`, 118pp): manual sig page dated **Sep 28, 2026** (Larry's explicit ask); ALL other binder dates stay **Sep 22, 2026** (Larry: "leaving everything 9/22 done" — NO rev9 sweep). Pushed to 3060.
- ✅ **11 deliverables built today** (all in ~/Desktop/ + audit/SCDHHS copies): QV+REV due route page (Grubbs addr corrected 10:06), Babb Jun-Jul tasksheet status, Beatty tasksheet breakdown 4/1–7/18, Beatty service review 1/1/25–4/19/26 (+ doc-gap correction re: AOO claims CSV), Chanelle Sept nurse visit list.
- ✅ **DSN reminder armed**: ONE-SHOT cron e4fcad1f-007a-4286-aa14-a43e27820923 @ 2026-09-28 22:30 EDT (read CMS-1500 batches for correct DSN days). Next DSN billing = Wed 09-30.
- ✅ **iMac caffeinate OFF** (per Larry) — plist kept, auto-returns next login. AC sleep back to 20/10.
- ✅ 3060 Chrome CDP reachable (tunnel 18802), but provider portal session LOGGED OUT — fresh Phoenix pulls need Larry's login.
- ✅ Graphify + vault daily synced at 10 PM; CAROL_FORM_MAP → Desktop ✓. Monday → no git push.

## PENDING / OPEN ITEMS
- 🔶 **OpenClaw on the 3060 (Windows)** — Larry wants it "when I have some time." Watch port/identity collision with Vance; keep bindings EXPLICIT. No date set.
- 🔶 **Binder pen signatures** (rev8): p6 §1.2 "Reviewed By" (Dinasti), p112 Owner Signature (Dinasti); p111 confirm both designation lines dated. Pages still dated 09/22 except p4 (09/28).
- 🔶 **Fresh Phoenix provider-activity pull** — Sept nurse visits + QV/REV due list = snapshot, not live. Portal logged out.
- ⚠️ **Stale-reminder lesson:** cron one-shots freeze a snapshot at creation → never phrase 'due TOMORROW / still open' as live; re-check before sending. Stale Wed 9AM REV cron removed 09-29.
- 🔶 **Chludzinski MC draft (14837697)** — awaiting Larry review/S&C.
- 🔶 **File cabinet lock (Larry's office)** — need back-of-lock photo + barrel length measure (5/8" vs 7/8"). Amazon links sent (Kingsley B01I0P3PLC, Pertinel B0BZNJ67M6).
- 🔶 Discourse remains: tally = 152; no re-check pass request yet.
- 🔶 Disk reclaims (uv cache 8.4G, CAROL tar 2.9G, backup-repo/.git 2.8G, billing mp4s 1.9G).

## SKILLS
- Applied: `carol-phoenix-automation` (20260927). Pending from 09-25: `phc-weekly-care-service-log-20260925-97a3eb915b`, `phc-tasksheet-marks-extraction-20260925-b605f9dc66`, `instrumental-maker` (Larry to review).

## WATCH ITEMS
- Tally = 152 (proof-based; Larry updates on S&C; file CAROL/CAROL_job_tally.md).
- DSN billing Wednesdays: CMS-1500 Submitted Batches = source of truth for worker days (esp. Bosworth).
- NEVER hand-type narratives in Phoenix; NEVER run browser probe during a fill batch.
- Vault write rule: apply_patch CANNOT touch vault/Desktop paths → always exec heredoc.
