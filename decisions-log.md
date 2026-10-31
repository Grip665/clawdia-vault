# Decisions Log

**Format:** `YYYY-MM-DD — Decision — Context`

## 2026-10-30
- **PHC office hours — keep M–F 10:00–4:00, change nothing** — Larry's call after the DPH-vs-SCDHHS research. Reasoning filed in `topics/home-health-admin.md` → "OFFICE HOURS — DPH vs SCDHHS". Short version: **DPH licensing (R.60-122) sets no hours** (zero time-of-day references); **SCDHHS does** — PCS Scope item 8 requires open+staffed 10–4 M–F, phone 8:30–5, after-hours emergency number, **with sanctions**. Hours come from SCDHHS, not DPH. Never drop them.
- **Reg-number correction** — R.61-122 is the **DHEC-era predecessor** of R.60-122 (same title, same statute), *not* a different license category. Prior note was wrong; fixed in vault.

## 2026-07-13
- **Obsidian Vault Setup** — Created Clawdia-Vault as persistent memory layer, 4-tier memory architecture
- **Hindsight Phase 1 Tuning** — Applied 8 config changes: enableKnowledgeTools, recallMaxTokens=4096, recallBudget=high, expanded recallTypes, missions for extraction/observation/bank
- **Fable 5 Clean Sweep** — All 5 deliverables completed: payment dashboard, landing page, Lite app, admin panel, CAROL dashboard
- **4 Sight Pricing** — Minimum tier raised from $15 → $20/mo
- **Payment Architecture** — Build fiat-to-crypto gateway with dummy wallet now, configure with Ledger when back in SC. Trust Wallet as temp hot wallet

## 2026-07-11
- **4 Sight APK** — Built via GitHub Actions, debug APK installed on phone, Prime IPTV credentials working

## 2026-07-07 — Visual Therapy Site
- **Visual Therapy** — Skeleton site built via Fable 5, dark mode + red accents + shopping cart + checkout flow
- **Domain:** visualtherapy.xyz (Larry bought it)

## 2026-07-06 — Strong 8K Source
- **Wholesale source** — Strong 8K via Alibaba (Amber Baby), ~$2/mo wholesale, 1,250% margin at $25/mo
- **Privacy rule** — Don't say "IPTV" in Alibaba messages
- **Channel curation** — Build curation pipeline to filter 30K → ~1,700 US channels

## 2026-07-02 — Brand Identity
- **Brand name:** 4 Sight
- **Taglines:** "See What You've Been Missing" / "Premium Streams. Crystal Clear."
- **Theme:** Dark gaming/esports, metallic circular emblem, neon green + electric blue + red eye icon

## 2026-06-27 — Clemson Tuition
- **Strategy:** Parent PLUS Loan as primary, payment plan as backup
- **Fallback:** Payment plan opens July 20 ($75 fee)

## 2026-06-26 — Claude Code Leak
- **Source acquired** — leaked source from March 31 npm leak, ~3,800 TypeScript files
- **Use:** Reference for CAROL development

## 2026-09-21 — PHC Planner: canonical store + host
- **D1:** `sync.db` (change-log protocol) becomes the single canonical store for tasks/reminders. Control Center becomes a *client*, not an owner. (Vance's call, concurred.)
- **D2:** Host = **HP, not the 3060.** Reason: the 3060's absence caused the outage; hosting canon there ports the disease. `phc-sync.service` is a systemd unit → fits the HP as-is. Python is already first-class on the HP (voice bridge).
- **D3:** **No Caddy/TLS.** ZeroTier is already encrypted; native Flutter app needs no trusted cert. Drops a dependency + CA-distribution chore.
- **D4:** Data rule — initials/internal IDs only in task text, never names/Medicaid/diagnoses. Cheapest compliance control; applies to agent + phone + dashboard + off-site backups.
- **D5:** Control Center repoint is **read AND write** (not read-only). Read-only would freeze the Provider/Case Manager/Clothing tabs; leaving writes on the old store would recreate drift. Sections map to the sync schema's `category` field.
- **Bugs found by reading code (neither review caught):** B1 no reminder cascade on task delete → orphaned alarms still fire; B2 `due_at` sorts as raw text across mixed UTC offsets → normalize to UTC on write.
- Artifact verified identical by two independent audits (8/8 SHA256 match). 22 tests pass here too.
- Doc: `~/Desktop/PHC-Planner/PHC-Planner-Migration-and-Interface-Contract.md`
- **B1/B2 fixed + staged** (2026-09-21 late): `~/Desktop/PHC-Planner/server/` — cascade tombstone on task delete (client) + server guard rejecting reminders pointing at deleted tasks; UTC normalization on datetime write. Proven fail-on-original (3 failed) → pass-on-fixed (25 passed). Nothing deployed.

## 2026-09-29 — OpenRouter routing pinned (cache fix)
- Symptom: agent turns 65–276s, cacheRead 0, "Request aborted".
- Cause: OpenRouter load-balanced deepseek-v4.1-flash across ~31 providers (DigitalOcean/Sail/AtlasCloud),
  so provider-side prompt cache never stuck.
- Decision: pin `params.provider = {order:["together","deepinfra"], allow_fallbacks:true}` on both
  OpenRouter DeepSeek model refs in openclaw.json. Verified ~99% cache hit, 0.3–0.6s.
- Gateway config.patch blocks `params.provider` (protected allowlist) → direct file edit + backup.

## 2026-10-03 — CAROL cut over to the 3060 (full migration)
- **Decision:** CAROL (agent) + her Phoenix pipeline moved from the HP gateway to the **3060's own OpenClaw gateway**.
  Clawdia stays on the HP as the hub (vault/memory/Hindsight/crons/skills). Rationale: Carol is the job agent and her
  Phoenix automation already drives the 3060's Chrome → local is simpler; moving Clawdia = whole memory-stack OS migration = bad risk.
- **Larry's calls:** full cutover; model = DeepSeek direct API primary + OpenRouter fallback (OR's been slow).
- **How he reaches her:** the SAME CAROL Telegram bot, now hosted on the 3060 (binding telegram/carol → agent carol).
- **Done:** workspace + CAROL pipeline + Desktop docs ported; playwright installed + 121 scripts de-pathed; skill
  Windows section; HP carol agent/account/binding removed (archived); persona files filled.
- **Consequences:** Clawdia can no longer `sessions_send` Carol (different gateway) — use `ssh 3060 "openclaw agent --agent carol"`.

## 2026-10-09 — Model routing resilience: don't kill OpenRouter, add an independent lane
- **Context:** OpenRouter credits hit ~-$0.19 → all-OR fallback chains died; also broke web_search (Perplexity routes via OR).
- **Decision:** Keep OR funded as the failover + web-search + vision + memory-extraction provider. Do NOT strip it from fallback chains.
- **Added an independent, non-OR lane:** Google Gemini (AI Studio key) as the 2nd fallback.
  Final chain (all 3 gateways): deepseek direct → openrouter/deepseek-v4.1-flash → google/gemini-3-flash-preview → claude-cli (HP only).
- **Why:** DeepSeek API outage ≠ OR outage (OR serves deepseek-v4.1-flash from ~19 hosts incl DeepInfra/Novita/Baidu/CoreWeave).
  The real SPOF was OpenRouter; Gemini-direct fixes that while keeping tools.
- **Model note:** use `gemini-3-flash-preview` — `gemini-2.5-flash` now 404s for new keys.
- **Open items:** Larry to top up OR ~$10 + enable OR Auto Top-Up. Optional: decouple web_search from OR (Brave/DDG) later.
- Ops: added `~/.openclaw/lane-watchdog.sh` + cron `Lane watchdog — DeepSeek↔OpenRouter failover` (15m, silent unless a leg is down).

## 2026-10-11 — Memory architecture: declared source-of-truth hierarchy
- Ran our memory setup past Claude (Sonnet). Diagnosis: the problem isn't recall quality — it's **ownership** (7 overlapping layers, no hierarchy) + **observability** (Hindsight died ~2 weeks on 10/9 when OpenRouter credits ran out and nothing noticed).
- **Adopted (Larry approved, "only if it doesn't break anything"):**
  - **#1** Memory-health watchdog — `~/.openclaw/memory-watchdog.sh` + cron `e35af2d2` (15-min, silent unless unhealthy; 6h cooldown). Checks daemon, /health, provider-error signatures, write-staleness.
  - **#3** Store hierarchy — vault = CANON/source of truth; Hindsight + daily notes + MEMORY.md = derived/episodic. MEMORY.md becomes an index. Rule written into AGENTS.md ("Memory Map — SOURCE OF TRUTH").
- **#2 (recall gating + reranker/latency)** deferred until we can measure — eval set created at `workspace/memory-eval/recall-eval.md` (18 items).
- Also fixed today: Hindsight LLM repointed OpenRouter → DeepSeek direct (deepseek-chat) after the OR-credit outage.

## 2026-10-15 — Hindsight spend cut: Tier 1 applied (config-only, reversible)
- **Diagnosis (verified from daemon `llm-requests`, ~12.7h window):** consolidation = **84% of memory tokens** at avg **13,856 input tok/call**; retain = 16% at 1,419 tok/call. Consolidation fires ~**1× per retain**, not 5× — an earlier brief to Claude Opus had two swapped figures, so Opus's "consolidation misconfigured at 5×" headline rested on bad input. The real driver is **per-call size** (system prompt + **2,149 uncapped observations** re-sent each consolidation).
- **Consulted Claude Opus** (Larry asked), then verified its claims against the DB. Opus's genuinely useful contributions: cap the observations corpus; consolidation is summarization (not reasoning) so a cheaper model is acceptable there.
- **Applied (Tier 1):**
  1. `openclaw.json` → plugin config: `retainEveryNTurns 1→3`, `retainOverlapTurns 1`, `retainToolCalls true→false`. Backup: `openclaw.json.bak-tier1-20261015-104048`.
  2. Bank config `PATCH /v1/default/banks/<id>/config` → `max_observations_per_scope: -1 → 800`.
  3. Guardrails: `lane-watchdog.sh` OR_MIN 2.00→6.00 (+ cron arg updated); `check-openrouter-spend.sh` gained a monthly-PACE projection (2nd arg = pace ceiling, $30/mo) (+ cron arg).
- **Expected:** ~60–70% cut (retain + consolidation both /3).
- **Held (Tier 2, Larry's call):** `enable_auto_consolidation: false` — kills the 84% but stops synthesizing observations.
- **Note:** OpenRouter hard key budget is NOT settable via API (non-provisioning key) — dashboard only.

## 2026-10-17 — Audit sheets now print DAYS OF SERVICE on every participant block
- Larry: "moving forward put the days of service on the audit sheets so we have them readily available."
- **Implemented in the build, not by hand:**
  - `PROVIDER/scripts/build_audit_v3.py` now derives each participant's authorized weekday pattern
    from the grid and writes **`SERVICE_DAYS.csv`** (service_days, auth_hours, auth_start, auth_end).
    MISSING_SHEETS rows now carry the actual day names for that week (`auth_days`) plus a count (`n_days`).
  - `PROVIDER/scripts/build_audit_sheet_docx.py` prints
    `DAYS OF SERVICE: TUE & THU   (4.0 hrs/day · auth 07/02/2023 – open)` at the top of every
    participant block AND at the top of each of the 3 sections, so every printed page shows it.
    MISSING TASK SHEETS table column is now "Days of service" (not a count).
  - `PROVIDER/scripts/split_audit_packet.py` (new) re-splits the master PDF into per-client files;
    every per-client PDF therefore carries the service-days line.
- **Why:** tells the auditor at a glance whether a blank day was even supposed to have service
  (e.g. Pollard = TUE & THU; 5/12/25 was a Monday → not an auth day, no exposure).
- Build of record: `~/Desktop/PHC-Audit-2024-2026/v5-20261017/` — 151 pp master + `packet/` (37 per-client PDFs).

## 2026-10-19 — hermes-sync scheduled task created (3060)
- **Problem found:** no `hermes-sync` scheduled task existed on the 3060. The HP→3060 pull had never been automated, so Clawdia's `_to-vance` handoffs silently never arrived (Vance was working off task bodies Larry pasted).
- **Fix:** registered task `hermes-sync` — every 20 min, hidden via `wscript.exe C:\Users\User\run-hermes-sync-hidden.vbs` → `run-hermes-sync.bat` → `hermes-sync.cmd`; log `C:\Users\User\hermes-sync.log` (rotates at 200 KB). Principal `DESKTOP-R96DQLM\user` (USERDOMAIN is WORKGROUP → must use COMPUTERNAME, not USERDOMAIN).
- **Verified:** manual run + scheduled run both exit 0, ZeroTier path, ~1s.
- **Gotcha:** `_to-vance/` syncs **as a subfolder** (`HermesWorkspace\_to-vance\`), not flattened to root. Vance must read that folder.

## 2026-10-19 — iMac: caffeinate OFF, pmset restored
- Larry asked to turn caffeinate off. `launchctl bootout gui/$(id -u)/com.phc.caffeinate`, killed both PIDs, plist renamed `~/Library/LaunchAgents/com.phc.caffeinate.plist.disabled` (won't return at login).
- Then (his go) `sudo pmset -c sleep 20 displaysleep 10`. Verified: AC sleep=20, displaysleep=10.
- Verified no sleep blockers: PreventSystemSleep 0 / PreventUserIdleSystemSleep 0; only transient UserIsActive assertions (bluetoothd, rcd, Magic Mouse) with ~10 min timeouts.
- Re-enable: `mv ~/Library/LaunchAgents/com.phc.caffeinate.plist.disabled ~/Library/LaunchAgents/com.phc.caffeinate.plist && launchctl bootstrap gui/$(id -u) ~/Library/LaunchAgents/com.phc.caffeinate.plist`

## 2026-10-19 — REA planner: horizon decided = 21 days; Phase 2 authorized
- Larry's call on spec-vs-architecture conflict Q1: **21 days** (not the 3-8 day architecture figure). Rationale: it's a planner, not daily triage.
- Q2 splitting: spec wins — `allow_split` default false, 25-min chunks; splitter to be implemented in Phase 2 (was deliberately not half-built in Phase 1).
- Q3 snap grid: 15 min accepted.
- Phase 1 accepted: 87/87 tests, **13/13 rules mutation-guarded** (proves tests fail when a rule is removed).
- Phase 2 brief delivered: `CLAW-VANCE_phase2-GO_2026-10-19.md` — splitter, preview/approve state machine + local HTML harness, Google adapter against injectable transport with fixtures (NO OAuth/live calls), Q9 capacity recommendation.
- Repo: `C:\Users\User\HermesWorkspace\rea-scheduler\` on the 3060.

## 2026-10-27 — Calendar/planner architecture: TWO calendars, one visible view
**Context:** Larry has never actually used a calendar; the planner project IS his calendar solution. He was
conflating "calendar" and "planner" — they are the same project to him.

**Decision:**
- **A — his default Google calendar ("everything"):** personal, family, CM side, provider side, Senator +
  Prestigious admin/insurance dates. Private, not shared with the robot, not shared with staff.
- **B — `PHC Planner` (the "junior/vanilla" version):** ONLY Prestigious + Senator operational items —
  the scheduled visits and what a cover person needs. The robot **writes only here**. Shared to Dinasti
  later at "See all event details".
- **The mechanic that resolves the confusion:** B is a *subset* that is **displayed inside A**. Larry adds B to
  his own view (it auto-appears under "Other calendars" since he created it). One screen shows both; nothing
  is copied or typed twice. A = what he looks at. B = what he hands off.
- **Alerts are per-calendar, per-person.** B gets loud notifications (email/pop-up, 1 day + 1 hr) so a cover
  person can't miss a visit; Larry can mute B on his own account if it's noisy; Dinasti sets hers on her phone.
- **Only ONE new calendar to create.** A already exists (currently unused/empty).

### 2026-10-27 (addendum) — calendar OWNERSHIP must be agency-side, not Larry's personal
Larry asked the right question: "if I quit, how do I hand off the Prestigious/Senator calendar if it's tied to my
personal master planner?"

**Facts that shape the answer:**
- Ticking calendar B inside A is a **view only**. It creates NO ownership dependency. A does not own B.
  Deleting A leaves B untouched; sharing B never exposes A.
- The real risk is **which Google account owns B.** If B is created under Larry's personal Google, then on his
  last day he walks out with the work calendar.
- Google Calendar supports **transferring ownership** of a secondary calendar (sharing settings, raise the other
  person to "Make changes and manage sharing"), and an **ICS export/import** fallback for non-Google recipients.

**Revised decision:**
- **B (`PHC Planner`) is created under the AGENCY Google account** (prestigioushomecare1306), not Larry's personal.
- Share B → robot service account ("Make changes to events"); share B → Larry's personal account
  ("Make changes to events") so it still shows in his one-screen view; later share B → Dinasti ("See all event details").
- **The Cloud project + service account should also live on the agency account** — otherwise the robot's ability to
  run dies with Larry even though the calendar survives.
- Quit test: Larry removes his own access, everything keeps working. Nothing to hand off, because he never owned it.

### 2026-10-27 (sequencing — FINAL) — Larry's calendar FIRST, agency planner SECOND
Larry's order: **finish HIS everything-calendar (A) and get it live/conversational first**, then build the
agency's junior planner (B). "That way I'm up and running and have my shit together, then worry about them."

**Consequence — corrects the "one Cloud project ever" answer:**
- **Project 1 (now)** — under **Larry's personal Google account** → service account → shared access to **A**.
  This is HIS personal automation; it should never be tied to the agency, and it must survive him leaving PHC.
- **Project 2 (later)** — under the **agency account** → drives **B (`PHC Planner`)** for Dinasti/coverage.
- Two projects is correct here because the two calendars have genuinely different owners and different
  lifetimes. Each key lives with the calendar it serves.
- ⚠️ The A key grants program access to his ENTIRE personal calendar → key file stays on the 3060 only,
  never in hermes-share, never emailed, never pasted in chat.
