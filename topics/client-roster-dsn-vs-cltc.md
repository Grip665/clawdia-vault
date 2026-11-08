# Client Roster — DSN vs CLTC (CANON — set by Larry 2026-11-07)

> **Read this before answering ANY question about a client's hours, schedule, or units.**
> Getting these two programs mixed up is a known repeat error. Do not re-derive it — use this file.

## 🟦 DSN / DDSN — exactly THREE clients

| Client | Aide | Notes |
|---|---|---|
| **Roxie Johnson** | Dollie Johnson | weekday pattern |
| **Sandra Smith** | Monica Hankerson | all 14 days, 3 h/day |
| **David Bosworth** | — | 2 h/day pattern |

- These three, and **only** these three, are billed on the SC Medicaid **CMS-1500 / DSN** biweekly batch.
- DSN **units are 15 minutes** → **4 units = 1 hour** (Roxie 12u = 3 h, 8u = 2 h).
- Pay rates: David $500 / Roxie $700 / Sandra $1,050 per biweekly batch (90 h, 360 units, $2,250 total).

## 🟩 CLTC / CDS — everyone else (including Mrs. Cohen)

- **Manuela (Mrs.) Cohen #9861304** is **CLTC — NOT DSN.** She is **not** on the DSN batch.
- All other PHC/CM participants are CLTC/CDS as well.

## ⚠️ THE RULE — how to read the Phoenix authorization grid

In `PROVIDER/reports/open_auth_*.html` (and Phoenix authorization screens), the per-day number
in the `Auth Units` column is **HOURS** for CLTC clients — **not** 15-minute units.

- **2.0 COMA + 2.0 PCS = 4 HOURS**, not 1 hour.
- Sanity check: compare the day number against the known shift length in
  `hermes-share/PROVIDER/coverage-log.md`. If they match 1:1, the number is hours.
- **Never** apply the DSN ÷4 conversion to a CLTC client.

## Mrs. Cohen — authorized week (verified 2026-11-07, both auths effective 2026-08-16, CM Stacy Wright)

| Day | COMA (h) | PCS (h) | Total |
|---|---|---|---|
| Sun | — | 5.5 | 5.5 (8:30a–2p) |
| Mon | 2 | 3 | 5 |
| Tue | 2 | 3 | 5 |
| **Wed** | **2** | **2** | **4** |
| Thu | 2 | 3 | 5 |
| Fri | 2 | 2 | 4 (9a–1p) |
| Sat | — | 6.5 | 6.5 (8:30a–3p) |

**Weekly total: 35 hours.** She is a **Mon–Fri + weekend** client (not "weekend only" —
that was a misread of an August coverage-gap note).

## History
- 2026-11-07: Larry caught both errors in one thread (Cohen called a "weekend client", and
  her 4 hours read as 1 hour by applying DSN units). See `vault/mistakes.md`.
