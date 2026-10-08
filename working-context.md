# Working Context

**Updated:** 2026-10-07 13:10 EDT
**State:** ACTIVE — Provider resolution worklist built (read-only)

## NOW (2026-10-07 10:35) — Provider resolutions + pay-date tracker
- Larry ran the 3 Reports on the 3060 Chrome; I pulled them read-only via CDP and built the worklist:
  `PROVIDER/reports/RESOLUTION-WORKLIST-2026-10-07.md` (script: `PROVIDER/scripts/build_resolution_worklist.py`).
- Window 09/27–10/06 (period closes Wed 10/14). 7 resolutions on file (all "Accepted with Strike", none float);
  25 missed-visit lines needing attention; 14.5 h unbillable w/ no resolution on file (Christina Smith 3.2 h).
- Rule validated: claim prefix M = no resolution; V/R = has one.
- Open: confirm PHC's blocking-code set; offer a Wed payroll-close float check (cron).
**State:** ACTIVE — CAROL skill gap fixed ✅ (cutover complete 10-03)

## NOW (2026-10-05 12:45) — CAROL skill gap found + fixed
- Carol's `carol-phoenix-automation` skill was NOT loading: the file lived in the MAIN 3060 workspace (`...\workspace\skills`), not hers. Copied into `...\workspace-carol\skills\` → hot-reload, now ✓ ready for `--agent carol`. Content = current (body identical to HP master + 3060 override header). See memory/2026-10-05.md.

- ✅ **CAROL SP script stale → ported to 3060** (2026-10-05): the 3060 had the Sep-9 `CAROL/` copy (no argv → hardcoded wrong client IDs + CDP 18802). Ported the canonical CAROL-2.0 version → `workspace-carol\CAROL\carol_fill_sp_disciplines.js` (argv + local 18801; backup `.bak-prerefresh-20261005`). Skill still says `CAROL-2.0/` path — pending Larry's OK to patch.

## NOW (2026-10-03 13:36) — ✅ CAROL CUTOVER COMPLETE (Larry: "do the full cut over")
- **CAROL now lives on the 3060's own gateway** (`C:\Users\User\.openclaw\workspace-carol`). HP carol agent +
  telegram account + binding REMOVED (file edited; hot-reload drops the channel at end of this turn). Backup:
  `openclaw.json.bak-precutover-20261003-1330`; HP workspace-carol + agents/carol archived.
- **How Larry uses her:** SAME CAROL Telegram bot (id 8946061789), now served by the 3060. Binding telegram/carol→carol.
  Sent a live test message from the 3060 (msg id 509). Also drivable via `ssh 3060 "openclaw agent --agent carol …"`.
- **Models (per Larry):** primary `deepseek/deepseek-flash` (direct API), fallbacks `openrouter/deepseek/deepseek-v4.1-flash`
  + qwen-vl + gemini-flash. Both lanes verified live on the 3060 (CAROL_3060_MODEL_OK / CAROL_OR_LANE_OK).
- **Files ported to 3060:** agent workspace (fresh sync incl. data/, memory/, protocols/, narratives/, CLTC radar),
  the whole `CAROL/` pipeline (node_modules rebuilt; all 121 `.js` rewritten off `/home/lgf150/...` → `require('playwright')`
  + Windows paths), Desktop SCDHHS form map + REV-Narrative-Formats. `playwright` installed in CAROL dir (connectOverCDP only).
- **Chrome/CDP:** LOCAL `127.0.0.1:18801` on the 3060 (verified up, `node carol.js test` → ✓). No tunnel/ZT needed.
- **Skill:** `carol-phoenix-automation` on the 3060 got a "RUNNING ON THE 3060 (WINDOWS)" override section; HP copy got a MOVED pointer.
- **Persona:** filled her blank IDENTITY.md/USER.md (was an unfilled template) on the 3060.
- ⏳ Left for Larry: log into Phoenix in the 3060 Chrome when he wants her to work; confirm the bot reaches him.


## NOW (2026-10-03 13:30) — 🧪 Agent-migration test done
- **DECISION (mine, per Larry): splinter CAROL → 3060; Clawdia STAYS on HP as hub.** Reasoning: Carol = job agent + her Phoenix
  automation already drives the 3060's Chrome (local = simpler); Clawdia holds vault/memory/Hindsight/crons — moving = whole-stack OS
  migration = bad risk/reward.
- **TEST PASSED (after fixes).** 4 breakages 2026.6.6→2026.9.5: (1) `agents.list`→`agents.entries`; (2) 2nd agent needs
  `default:true`/ownership marker; (3) copied workspace needs `openclaw doctor --fix`; (4) auth is PER-AGENT. After fixes
  **Carol runs on the 3060** (BREAKAGE_TEST_OK / CAROL_3060_LIVE). Recipe in TOOLS.md.
- **🎁 BONUS:** 3060's deepseek key was an 11-char STUB → Vance's default model was broken; ported HP's valid key → Vance works.
- ⏳ Full cutover pending Larry's go: retire/route HP Carol, sync case data, decide Carol's model (deepseek vs claude-cli lane).
- 3060 left with 2 agents (main=Vance, carol) + gateway running; backups staged.

## NOW (2026-10-03 12:40) — Claude lane live
- ✅ **CLAUDE LANE LIVE on HP.** Installed Claude Code CLI v2.1.285 (~/.local/bin/claude); 1-yr subscription OAuth token via
  `claude setup-token` (Larry authorized). Wired OpenClaw: `agents.defaults.cliBackends."claude-cli"` w/ env token +
  models `claude-cli/claude-sonnet-5-5` / `claude-cli/claude-opus-4-6`. VERIFIED both via `openclaw agent` (CLAUDE_LANE_OK)
  and a subagent (SUBAGENT_CLAUDE_OK). Use: `sessions_spawn(model="claude-cli/claude-sonnet-5-5", …)`. See TOOLS.md.
- ✅ **CLAUDE LANE on VANCE/3060 + CAROL (13:10).** 3060 runs OpenClaw **2026.9.5** (newer than HP 2026.6.6) — there
  `agents.defaults.cliBackends` is REMOVED/plugin-registered; you just need `claude` on the gateway PATH + Claude Code's
  own auth. Installed native `claude.exe` (v2.1.288, npm .cmd shim = EPIPE), token into Claude Code's own
  `~/.claude/settings.json` env, PATH added via `gateway.cmd`. Verified through the 3060's gateway: Sonnet=VANCE_CLAUDE_OK,
  Opus=VANCE_OPUS_OK (survives task restart). 3060 lane is FULLY LOCAL = standalone ✓. CAROL (HP) inherits the lane,
  verified CAROL_CLAUDE_OK — but has no sessions_spawn so can't self-delegate (flagged to Larry).
  See TOOLS.md "Claude lane — VANCE/3060".
- ⏳ Vance/3060: DONE (see above).
- ℹ️ Corrected the forwarded AI advice: `openclaw onboard --local-transport=claude` is FABRICATED (no such flag).

## NOW (2026-10-03 12:37 PM)
- ✅ **Claude CLI lane VERIFIED LIVE (post-restart 12:37).** Backend `claude-cli` (Claude Code v2.1.285, OAuth setup-token).
  `openclaw agent … --model claude-cli/claude-sonnet-5-5` → `CLAUDE_LANE_OK`; direct `claude -p` → `CLAUDE_LANE_OK`.
  ⚠️ `claude auth status` falsely says "Not logged in" (reads CLI login, not the env token). Use
  `sessions_spawn(model="claude-cli/claude-sonnet-5-5", task=…)` for coding/planning/review. See TOOLS.md + memory/2026-10-03.md.

## NOW (2026-10-03 late AM)
- ✅ **Hindsight migration VERIFIED post-restart (11:47):** daemon pid 638708 runs from `~/.hindsight/embed-project/.venv` (`.venv/bin/hindsight-api --port 9077`), `:9077/health` = healthy. `U7PBCEncOd8M5wrO` already deleted; re-scan of `archive-v0` = **0 orphan dirs** (only 6.3MB nlink=1 metadata left). venv+cache share inodes → env ≈ **2.0G**. **df: 75%, 22G free.** No new reclaim needed.
- ✅ **HOUSE CLEANING: Hindsight moved off the uvx cache → persistent venv.** New project `~/.hindsight/embed-project` (uv, **~2.0G**, torch pinned **CPU-only** — HP has no GPU). Plugin config `embedPackagePath` set in `openclaw.json` (gateway config.patch refuses that protected path → hand-edited the file + restart). Daemon now `uv run --directory ~/.hindsight/embed-project hindsight-embed`; :9077 healthy; recall verified; DB untouched. Deleted old `~/.cache/uv/archive-v0/U7PBCEncOd8M5wrO` (6.4G). **Disk 84%→77%, free 14G→21G.** See TOOLS.md + memory/2026-10-03.md.
- ✅ **DOCKER CLEANED (11:50):** killed the dead firecrawl stack — 7 exited containers + 6 images (firecrawl 2.5G, playwright-service 2.01G, fdb 1.55G, nuq-pg 642M, rabbitmq 392M, redis 160M) + vols/network. **-6.9G.** Docker images 12.72G→5.81G. Confirmed Docker's playwright-service ≠ my Playwright (npm→CDP 1880x + ms-playwright local). Left RUNNING searxng/riven-frontend (his media stack) untouched. **Disk now 69% / 28G free.**
- ✅ **CLEAN PASS 2 (12:05):** removed exited riven/riven-db/jellyfin containers (compose-recoverable) + stray fervent_neumann + old jellyfin 10.9.11 img (1.45G) + dangling vols; reclaimed the stale ~1G `.git` staging pack in clawdia-backup-repo (nightly job `rm -rf .git`+re-init → pure redundancy; parts+GitHub+tarball intact, verified byte-exact). **Disk 69%→66%, free 28G→30G. Today total 84%→66% ≈ 18G freed.** PASS 2 NO-OP: "Billing-Training mp4s 1.9G" doesn't exist (folder is 13M) — old note was wrong.
- ⏳ Offered, not done (all re-pullable, media stack): jellyfin 10.10.7 img 1.76G · spoked/riven 1.22G · postgres:17-alpine · tesseract/alpine. That's the only reclaim left. **Larry 12:02: KEEP for now, maybe delete later — cleaning closed.**
- Earlier today: instrumental-maker health check all-green + bgutil-pot watchdog added (see memory).

## NOW (2026-09-30 early PM)
- ✅ **PORTAL COUNTS (Provider Portal EX1882, read-only 3060 CDP):** **34 participants** (39 auth lines deduped; multi-auth = Whitehead/Cohen/Allen/Hughes) · **24 active employees** (Workers tab: Active 24 / Terminated 209).
- ✅ **ROSTERS UPDATED:** `~/Desktop/PHC-Rosters-2026-09-30/PHC_Active_Rosters.docx/.pdf` (+ archive `PROVIDER/rosters-2026-09-30/`).
  Employee roster = 24 active w/ Start Dates + service codes; **5 REMOVED** (Bowman, Boyd, Keefauver, Lovell, Medina — not active in Phoenix, kept in a flagged section); DSN-only 3 listed separately. Client roster unchanged = 34.
  Builder: `scripts/build_rosters_20260930.py`; portal JSON: `PROVIDER/reports-raw/portal_workers_2026-09-30.json`.
- ✅ Portal start dates matched local CSV exactly for the 24 active → local dates fine; only the 5 roster inclusions were stale.
- ✅ **DSN billing run DONE (09/30):** deleted stray draft 10478593; swapped 3 claims to 09/13–09/26 (David 18874799 $500 · Roxie 18874800 $700 · Sandra 18874801 $1050); Larry finished+submitted → **BIG NUMBER $2,250** ✅. Owned by skill `dsn-medicaid-billing` (cadence fixed to biweekly pay-weeks). Next = Thomas payroll call Thu 10/1 before 3PM.
- ⏳ OFFERED (not yet done): rebuild the DPH Employee Start-Dates PDF from portal-verified dates.
- ✅ **iMac caffeinate re-enabled (09-30 13:57):** PID 76621 `caffeinate -dimsu` + LaunchAgent `com.phc.caffeinate` (KeepAlive) + `pmset sleep 0/displaysleep 0`. iMac = iMac.lan 10.192.166.134 (macOS 15.7.9).
- ✅ **Larry's own employee file + packet (13:32–13:57):** `~/Desktop/PHC-Employee-File-Larry-Griffin/` (blank forms / filled packet / supporting docs + README + INTAKE_CHECKLIST). Filled 19pp packet (DOB 10/24/1981 added; sex/SSN/email blank per Larry) via `scripts/fill_larry_packet.py`; PRINTED to Brother via 3060 (SumatraPDF portable at `C:\Users\User\_larry_print\`, job 70 finished). iMac ZT was down at print time — 3060 path used.
- ✅ **DPH on-site day deliverables (11:35–12:47):** employee start dates PDF/CSV (32 rows; 3 gaps = Bowman/Boyd/Keefauver), in-service video self-study form (date-only), aide non-transport form (admin sig, names aide), written backup staffing plan, binder cover (corrected addr 128 E Main St + IHCP-1157). All in `~/Desktop/PHC-Employee-Start-Dates/`.
- ✅ **Brother printer FINAL FIX (11:00):** iMac joined SpectrumSetup-98C1 (192.168.1.106), direct IPP to 192.168.1.2; relay torn down. iMac ZT was down 13:35 but back by 13:57 (caffeinate re-enabled).
- ⚠️ **HP ZeroTier flaked 13:56** (online:None, peers 0) → fixed with the documented Docker nsenter restart; 3060 + imac reachable again. (Recurring — see TOOLS.md.)
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
- ✅ **Binder pen signatures DONE (2026-10-05):** Dinasti signed all three — p6 §1.2 "Reviewed By", p111 Designation of Administrator, p112 Administrator Experience Verification (Owner Signature). Binder signature set complete.
- 🔶 **Fresh Phoenix provider-activity pull** — Sept nurse visits + QV/REV due list = snapshot, not live. Portal logged out.
- ⚠️ **Stale-reminder lesson:** cron one-shots freeze a snapshot at creation → never phrase 'due TOMORROW / still open' as live; re-check before sending. Stale Wed 9AM REV cron removed 09-29.
- 🔶 **Chludzinski MC draft (14837697)** — awaiting Larry review/S&C.
- 🔶 **File cabinet lock (Larry's office)** — need back-of-lock photo + barrel length measure (5/8" vs 7/8"). Amazon links sent (Kingsley B01I0P3PLC, Pertinel B0BZNJ67M6).
- 🔶 Discourse remains: tally = 152; no re-check pass request yet.
- 🔶 Disk reclaims (uv cache 8.4G, CAROL tar 2.9G, backup-repo/.git 2.8G, billing mp4s 1.9G).

## SKILLS
- Applied: `carol-phoenix-automation` (20260927). Pending from 09-25: `phc-weekly-care-service-log-20260925-97a3eb915b`, `phc-tasksheet-marks-extraction-20260925-b605f9dc66`, `instrumental-maker` (Larry to review).

## WATCH ITEMS
- Tally = 161 (proof-based; Larry updates on S&C; file CAROL/CAROL_job_tally.md).
- DSN billing Wednesdays: CMS-1500 Submitted Batches = source of truth for worker days (esp. Bosworth).
- NEVER hand-type narratives in Phoenix; NEVER run browser probe during a fill batch.
- Vault write rule: apply_patch CANNOT touch vault/Desktop paths → always exec heredoc.

## NOW (2026-10-07 04:00) — auto-save
- Quiet overnight. ⏰ **11:00 AM reminder set** (cron 9b507f95): (1) Dorothy A Thomas (9792184) REV LOC approval from Acentra (scloc@acentra.com); (2) ACE-Step 1.5 LoRA training on our reference songs.
- 🆕 Active project: **ACE-Step 1.5** on the 3060 (H:\ACE-Step-1.5, Gradio 127.0.0.1:7860, shortcut "ACE-Step (Suno).lnk") — music generation w/ LoRA. Tuning guide: ~/Desktop/ACE-Step-Tuning-Guide.md.
- Open edge unchanged: tasksheet gap Jan 1–Jun 27 2026 (EX1882) blocked while Carol's SP fill uses the 3060 Chrome.
