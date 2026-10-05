# Planner — Personal AI Planner (PRODUCT, not just personal) — v0 canvas
_Created 2026-10-03. Larry's vision: a live planner/calendar assistant — due dates, what's-next per project, reminders — a 24/7 assistant. Goal is to build it AND sell it._

## One-liner
An AI assistant that already knows everything you've got going on, tells you what's due and what's next, and nudges you before things slip.

## The whole product = 3 capabilities
1. **Capture** — add tasks/deadlines from anywhere (chat, voice, text).
2. **Know** — a live model of projects → tasks → due dates → next action.
3. **Nudge** — proactive reminders + daily/weekly briefs; "what's next?" on demand.

## Why it can be incredible (differentiators)
- **Agentic + proactive** — not a static calendar. It acts and reminds.
- **Lives in your messages** (Telegram/SMS/WhatsApp) — usable before any app exists.
- **Private / local-first** — can run on your own hardware; nothing leaves home.
- **Bridges to the computer** — phone is a window into an agent that can actually DO things.

## Architecture (3 layers)
- **Brain:** agent (Vance/Hermes or Clawdia/OpenClaw) + planner DB (SQLite) + scheduler/cron.
- **Bridge:** private tunnel (ZeroTier/Tailscale) or hosted API w/ auth. Phone ↔ laptop.
- **Surface:** messaging (Telegram first) + optional Flutter app dashboard (reuse 4sight_app scaffold).

## MVP (v1) — sellable, weeks not months
- Schema: projects, tasks, due_date, recurrence, status, next_action, source.
- Ingestion: Telegram commands + natural language.
- Daily brief + due-soon reminders via Telegram.
- Simple read view: today / next 7 days / by project.

## ⚠️ HARD BOUNDARY (matters for selling)
Personal planner = **generic product**. Case management (CAROL / Phoenix PHI) stays SEPARATE.
Selling a tool that touches PHI = HIPAA/BAA territory. Do NOT blend them.

## Non-goals (v1)
- No cross-app phone automation (battery sink).
- No PHI. No multi-tenant complexity yet.

## Monetization directions
- Freemium: free chat planner → paid hosted agent + app + integrations.
- "Bring-your-own AI key" tier.
- Vertical plays: other social workers (careful), contractors, creators, busy parents.

## Open decisions (LARRY)
1. Telegram-first or app-first?
2. Brain host: 3060 (Vance) or HP (Clawdia or OpenClaw-like)?
3. Phone OS: Android or iOS?
4. Top 3 "due" sources for personal v1?
5. Target customer + local-first vs hosted?

## Roles
- **Vance** (Hermes): build + host the service, own the crons.
- **Claude** (claude-cli lane): codegen — schema, API, Flutter; code review.
- **Clawdia** (HP): data model, coordination, CAROL/Phoenix due-date feed.

---
## v2 — RESILIENCE-FIRST (2026-10-03, Larry pushed back)
Larry's objection: "laptop doesn't have internet or dies → boom no app. Too constraining to be bolted to a laptop."
He's right. Single-laptop-host = single point of failure. (Relatable: the HP has been flaky; he literally
took the 3060 to work as a redundant agent.)

**Principle: the planner is host-agnostic + always-on. No single machine owns it.**

Architecture v2:
- **Control plane (always-on):** planner DB + scheduler + agent runtime + API. Runs on a cloud VPS
  (cheap, $5–10/mo) or a home always-on mini-PC/NAS. This is what makes it 24/7 + sellable (SaaS).
- **Nodes (optional workers):** HP / 3060 / iMac register as nodes for local abilities (files, Chrome,
  casework). If a node is off, the planner keeps running — it just can't do that node's local actions.
- **Surfaces:** phone app + Telegram/WhatsApp + web. All talk to the control plane.
- **Offline resilience:** app caches locally; reminders ALSO scheduled as on-device local notifications
  so they fire with no internet. Queues writes, syncs when back.
- **Deploy = Docker.** One image runs on VPS / mini-PC / laptop. No lock-in — moves anywhere.

Two flavors (decide):
- A) **Cloud SaaS** — best for selling. Always-on, multi-tenant later.
- B) **Home always-on box + cloud fallback** — best for privacy. More moving parts.
Lean: build the Docker image now; deploy to a cheap VPS first (A), add home node later.

Still open: phone OS (Android/iOS); Telegram-first vs app-first; target customer.

---
## v3 — CLAUDE'S ARCHITECTURE (2026-10-03, claude-sonnet lane)
Core stance: **phone is the primary system of record; server is a durable replica + sync hub + always-on worker.**
Local-first app with a sync hub — NOT a thin client, no laptop involved. Server down for hours = only cross-device sync pauses.

- **Pattern:** local-first, event-sourced-ish. UI reads only local SQLite. Client writes local first → outbox mutation log → sync engine pushes, pulls by cursor. Sync triggers: app foreground, WorkManager (~15 min, network-constrained), FCM nudge.
- **Conflicts:** per-field **last-write-wins with hybrid logical clocks (HLC)** — NOT CRDTs (overkill for single-user planner). Delete beats edit unless edit newer.
- **Stack:**
  - App: **native Kotlin + Jetpack Compose** (NOT Flutter) — reliable AlarmManager/notification channels/OEM workarounds.
  - Local DB: **Room (SQLite)** + `outbox` + `sync_meta`.
  - Sync: custom thin HTTPS/JSON protocol (or buy PowerSync/ElectricSQL).
  - Backend: **TypeScript/Fastify** (or Ktor) single service.
  - Server DB: **Postgres** (managed) + **row-level security** per `user_id` + per-user change sequence for the cursor.
  - Auth: managed (Firebase/Supabase/Clerk) + **Google sign-in**; Postgres RLS.
  - Push: **FCM data messages (high priority) = wake-and-sync nudge ONLY** (no payload → nothing leaks via Google).
  - Hosting: one always-on container (Fly.io / Railway / Cloud Run min-instances=1) + managed Postgres.
- **Reminders:** the DEVICE fires them, never the server. `AlarmManager.setExactAndAllowWhileIdle` + BroadcastReceiver posts from Room (no network). Re-arm on writes/sync/boot/package-replace/time+tz change/permission change. WorkManager reconciler every ~6–12h rebuilds next 7 days. Materialize 30 days of occurrences. Server change → FCM → device pulls → re-arms. Add OEM battery onboarding check + "test reminder in 1 min" button.
- **Sync model:** entities = task/event/reminder/recurrence_rule/list/tag; client UUIDv7 id, updated_hlc, soft delete, server_seq. Idempotent mutations. Recurrence syncs the RRULE + exceptions, not occurrences. Store UTC + IANA tz + floating flag. 30-day revision log server-side.
- **Server duties:** auth/tenancy, sync endpoints, FCM nudger, AI worker (daily brief, week-overload, email/calendar import), backups/PITR.

**Clawdia adds — V1 scope, risks, differentiator:**
- V1: single-user, one device — create/edit tasks+events, due dates, basic recurrence, LOCAL reminders, fully offline. V1.5: account + multi-device sync. V2: AI layer (quick capture, daily brief, "what's next"). Sell: hosted multi-tenant + Google login.
- Top risks: (1) Android OEM battery management killing reminders = #1 support load; (2) sync conflicts/data loss — build outbox + revision log early; (3) AI cost/latency at scale.
- Differentiator vs Google Cal/Todoist: it's an **agent** that tells you what's next and acts, local-first/private, works offline.
- **Deviation to decide:** Claude says native Kotlin, not Flutter. Trade-off: Kotlin = most reliable reminders; Flutter = reuse 4sight scaffold + cheap iOS later.

---
## Build muscle available (2026-10-03)
- **Claude Code CLI lane** (HP): `claude-cli/claude-sonnet-5-5` (alias Claude Sonnet) + `claude-cli/claude-opus-4-6` (alias Claude Opus).
  Use **Opus** for hard architecture / tricky codegen, **Sonnet** for volume. Spawn via `sessions_spawn(model="claude-cli/claude-opus-4-6", ...)`.
- Vance (3060) also has Claude Code installed natively (`claude.exe`); Carol inherits the lane on the HP.
- Larry's note: switch to Opus (or another model) when we need more horsepower.

---
## TWO PLANNER TRACKS — keep separate (2026-10-04)
1. **Consumer planner** (`~/.openclaw/workspace/planner/`) — NEW, sellable, NO PHI. Kotlin+Compose, M1 offline APK delivered by Vance (git 1a6b74a), offline reminder path PROVEN on emulator `planner_test`. M2 in progress.
2. **PHC-Planner** — Larry's WORK/home-care planner (PHI). Lives at `~/Desktop/PHC-Planner/` + `~/.local/share/phc-planner/`. Sept-21 artifacts: design brief (recommends native Flutter app over PWA) + an implemented Python sync server (`sync_server.py`, `/sync/push`+`/sync/pull`, manage.py, sync_client.py, 22 tests, loopback-only + Caddy/ZeroTier). **Only the server was built — no Flutter client exists** (this is why the "reuse the Flutter work" instruction was a ghost).
   - **Borrow for consumer M3:** the sync pattern (change log, per-field LWW, tombstones, server_seq cursor, device tokens, future-clock reject). Reference copy pushed to Vance's workspace.
   - ⚠️ NEVER merge PHC content (PHI) with the consumer product.
