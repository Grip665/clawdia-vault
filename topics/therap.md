# Therap (Prestigious Home Care / DDSN track)

Login: **https://secure.therapservices.net/auth/login**
Therap is the **DDSN** system (separate from Phoenix/SCDHHS). DSN participants
(Sandra Smith, Roxie Johnson, David Bosworth) live HERE — their nurse/supervisory
visits are documented on paper + in Therap, **not in Phoenix or EVV**.

## Logins (Larry, 2026-10-16)
- **dinasti.jones** / `Daycemom23!`  (Dinasti Jones — owner/admin)
- **jwill** / `Clemson@665`  (Jay Williams — admin)
- Legacy: `tdupree` / `Prestigious1306!` (old admin acct, from the Aug billing-training password sheet)

## Standing reminder
Larry (10/16): log into **each** account **at least twice a month**.
Cron job `therap-login-twice-monthly` (runs the **1st + 16th at 9:00 AM ET**, main session).

## Open investigation (started 2026-10-16)
Larry wants to find **where the DSN/participant documentation lives in Therap** —
i.e. where the nurse/supervisory visit records and participant files sit, so we can
stop guessing from paper. Method: log in on the 3060 Chrome (CDP `127.0.0.1:18801`)
and walk the menus.

## Related
- Super Admin reset history: `~/Desktop/PHC-Therap-Reset/` (Dinasti reset, Oct 8).
- `vault/references/cltc-cm-record-requirements.md` — the *CM* (Phoenix) side, for contrast.
