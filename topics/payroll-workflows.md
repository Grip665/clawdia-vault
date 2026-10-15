# 💰 Payroll Workflows — New Job (2026-08-06)

## Status: 🔵 Incoming
- Larry got a new job (payroll-related). Transcript from today (2026-08-06) coming — not yet received.
- Awaiting: login info for each payroll site involved.

## Constraints (stated by Larry)
- **NEVER submit anything** — no scripts/agents submit on payroll sites. Ever.
- CAROL = read-only extraction: pull important numbers, Larry reviews, Larry submits manually.
- Same discipline as Complete/Sign page of service plans.

## TODO
- [ ] Receive today's transcript from Larry
- [ ] Get list of payroll sites + login info
- [ ] Scope read-only workflows (what numbers matter)
- [ ] Build extraction scripts (CDP, read-only) once sites known

## Related
- Uses same CDP/Chrome-on-3060 infra as CAROL (tunnel_3060.sh, Playwright CDP port 18801)

## Update (2026-08-06, evening)
- ✅ Transcript received + saved: `payroll/transcript-2026-08-06.txt`
- Larry will try to take **videos** of the workflows so I can follow the exact screens/buttons later
- Next trigger: when Larry has all logins → build read-only extraction workflows

## Rule AMENDMENT (2026-08-06, evening)
- **Amended (Larry):** I CAN click dropdown menus + select certain options — needed to navigate report pages, pick date ranges, filters, etc.
- **Hard rule unchanged WHERE IT MATTERS:** on pages where actual submission happens (submit batches, approve claims, save/process payroll, sign off) — NEVER submit. Larry submits himself.
- Net: interaction allowed for **navigation/filtering/viewing**; **submission/processing** stays hands-off.

## 💵 DSN payroll inputs — fixed patterns (Larry 2026-10-14)
DSN clients' hours get written on the **Provider Summary** for the payroll call (Thomas, Thu before 3 PM). DSN is paid from the **Medicaid portal**, not Phoenix.
- **Roxie Johnson (3424309401)** — days **FIXED**: **Mon–Fri × 2 weeks = 10 days/period**. Mon–Thu 12u ($75) = 3 h; Fri 8u ($50) = 2 h → **28 h, $700**. *(History: was Mon–Thu/8 days until ~Jul 2026; Mon–Fri/10 days from Aug 2026.)*
- **Sandra Smith (5717387901)** — days **FIXED**: **daily Sun–Sat = 14 days/period**, 12u/day ($75) = 3 h → **42 h, $1,050**.
- **David Bosworth (1781105736)** — lines **CHANGE every period**; never blind-swap, get the days from Larry / read his current claim.
- **Only the DATES change** for Roxie & Sandra — roll forward +14 each pay period. Verified against submitted batches.
- Units→hours: 12u = 3.0 h · 8u = 2.0 h (T1019 @ $25/h).
- Source-of-truth days: Medicaid portal → History → CMS-1500 Submitted Batches. Extracted data: `PROVIDER/dsn-david-history/{roxie,sandra,david}_days_all.md`.
- Worked example (period 09/27–10/10/2026): David 20.0 · Roxie 28.0 · Sandra 42.0 = **90.0 h** → `PROVIDER/reports/DSN_Payroll_Inputs_2026-10-14.md`.

## ✅ DSN run log — 2026-10-14 (period 09/27–10/10)
- Copied batch 5235450 → drafts 18930083 (David $500) · 18930084 (Roxie $700) · 18930085 (Sandra $1,050); date-swapped +14.
- Larry finished + submitted → new batch **5252922** @ 2026-10-14 14:29 · 3 claims · **$2,250.00** (BIG NUMBER printed).
- Next DSN run: Wed **2026-10-28**.
