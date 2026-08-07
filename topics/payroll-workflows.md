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
