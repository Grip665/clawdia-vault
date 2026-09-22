# Decisions Log

**Format:** `YYYY-MM-DD — Decision — Context`

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
