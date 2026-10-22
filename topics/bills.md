# Bills & Upcoming Payments

Tracker for Senator Transportation LLC (and related) bills Larry flags. Reminders in OpenClaw cron where noted.

## 🚨 URGENT
| Item | Policy # | Amount | Key Dates | Status |
|------|----------|--------|-----------|--------|
| ~~Biberk — Workers Comp~~ (Senator Transportation) | N9WC796997 | $517.42 | — | ✅ **PAID 8/18** |
| **Biberk — Workers Comp** (recurring MONTHLY) | N9WC796997 (ends 96997) | $517.42 | **due before 9/24** (monthly) | 🔁 monthly |
| ~~Spectrum Internet~~ | — | $361.90 (full) | — | ✅ **PAID 8/18** |

## Standard
| Item | Policy # | Amount | Due |
|------|----------|--------|-----|
| Biberk — Workers Comp (2nd policy) | N9WC080186 | $524.63 | 9/13/2026 |
| Verizon Connect | — | $116.95 | **11/14/2026** (Larry 10/16) |
| Biberk — policy (paid 2/16/26) | N9PL497108 | $279.45 | 11/12/2026 |
| USLI (billing ref UIA-489481-120525) | AH 1563617C | $902.00 each | **11/09/26 · 01/08/27 · 03/09/27** (3 payments) |
| Now Insurance | — | monthly | Paid every 5th — **UP TO DATE** ✅ |
| ~~USLI~~ (merged above) | — | — | — |
| **Sardy's Insurance / Progressive — Auto** | 876601435 | TBD | **11/06/2026** (Larry 10/16) |

## Progressive Auto — payment info (logged 2026-10-14; provider added 2026-10-16)
- **Carrier:** Progressive — **via Sardy's Insurance** (FL agent)
- **Agent phone:** **305-485-0116** (provider number on the password doc)
- **Auto policy #:** 876601435 ("Senator Trans FL Auto Insurance")
- **Policy owner:** Pierre Dupree = Thomas Dupree (same person) — owner of Senator Transportation LLC (confirmed 2026-10-16). See `vault/topics/senator-transportation.md`.
- **DOB:** 12/27/1986 · **ZIP:** 33127
- Source: password doc (`Desktop/Billing-Training/transcripts/password_doc.txt`, §5C) + insurance list. **No dedicated Progressive online login saved** (as of 10/16).
- **Due: 11/06/2026** (Larry, 10/16). Amount still TBD — capture when the bill shows up.

## Account phone numbers
- Biberk acct w/ N9WC080186: **864-479-0020**
- Biberk acct w/ N9WC796997 (the cancel-risk one): **864-631-3537**

## Notes
- Biberk N9WC796997 = **$517.42 MONTHLY** (confirmed 8/25) — next due before 9/24. The 8/18 payment covered the 8/26 invoice; treat as recurring monthly. Cancel risk was 9/2 for the prior invoice — keep current one paid.
- Spectrum: flag if service drops — office internet critical for dispatch/billing.
- USLI AH 1563617C: three $902 payments (11/9/26, 1/8/27, 3/9/27).

## 🛡️ NOW Insurance — Professional Liability renewal 12/05/2026 (logged 2026-10-21)

**Source:** email from no-reply@nowinsurance.com, 2026-10-21 03:00 EDT → prestigioushomecare1306@gmail.com

- **Policy:** UIA-489481-120525 · **auto-renews 12/05/2026**
- **Rated on:** $25,000.00 "Named Insured's gross revenue/receipts"
- **Their warning (verbatim):** "NOW Insurance must be notified if Named Insured's actual or expected gross revenue
  increased. Failure to update this information may affect your coverage eligibility in the event of a claim."
- **Contact:** customerservice@nowinsurance.com

### ⚠️ Open question 1 — the revenue basis looks stale
The policy is rated on **$25,000** gross revenue. biBERK workers' comp payroll data for PHC shows
**~$434K** (class 8810 clerical $40,302 + class 8835 homemaker $393,642). Payroll cannot exceed revenue by
that margin, so $25K reads like an original minimum-premium basis that was never updated. Understating
revenue is the exact fact pattern that lets a carrier question a claim. **Fix before 12/05.**

### ⚠️ Open question 2 — which policy actually renews?
This tracker already ties **UIA-489481-120525** to **USLI policy AH 1563617C**, period 06/22/2026–06/22/2027,
billed in 3 installments of $902.00 (11/09/26 · 01/08/27 · 03/09/27). The NOW email calls UIA-489481-120525 a
*Professional Liability* policy renewing 12/05. Reconcile with the agent: term renewal, installment reset, or a
second separate PL policy. Also request the **ACORD certificate** for binder Tab 6 (the packet on file is the
declarations pages, not a certificate).

### Reminders set (OpenClaw cron, delete-after-run)
- `06ac0554` — **11/05/2026 10:00 ET** — 30-day: correct revenue + reconcile renewal date
- `3c8ead18` — **11/28/2026 10:00 ET** — 7-day nudge
- `49a4b20b` — **12/04/2026 10:00 ET** — final, day before renewal

## ✅ CORRECTION + full policy summary — NOW Insurance (2026-10-21 10:50)

**My earlier "open question 2" was wrong — this is a SEPARATE policy, not a USLI billing ref.** Larry supplied the
full email. Two distinct policies are in force:

| | NOW Insurance | USLI |
|---|---|---|
| Policy # | **UIA-489481-120525** | AH 1563617C |
| Term | **renews 12/05/2026** | 06/22/2026 – 06/22/2027 |
| Limits | **$250,000 / $750,000** | GL $1M/$2M + PL $1M/$1M |
| Deductible | **$0** | (per declarations) |
| Premium | **$80.59/mo est.** (~$967/yr) | $4,511/yr (3 × $902) |
| Program | Allied Healthcare · Home Health Agencies | Home Health Aide (non-medical) |
| GL | Included | Included |

**Full policy summary from the email:**
- Named Insured: **"Prestigious Home Health"** ⚠️ (legal entity is *Prestigious Home Care, LLC*)
- Phone 864-631-3537 · prestigioushomecare1306@gmail.com
- Contact: customerservice@nowinsurance.com · **(888) 585-2075**
- Dashboard: https://app.nowinsurance.com/customer/dashboard — **certificate of insurance downloadable any time**
- NOW Insurance Services, Inc., 11807 Westheimer Road Suite 550 PMB 990, Houston TX 77077 · CA License #6007534

### ⚠️ NEW findings from the summary (2026-10-21)
1. **ENTITY NAME MISMATCH** — policy is issued to *"Prestigious Home Health"*, but the agency's legal name is
   *Prestigious Home Care, LLC*. If there's no DBA filing for that name, a carrier can dispute who is actually
   insured. Fix the named insured or document the DBA.
2. **LIMIT IS THIN** — $250K/$750K vs the USLI policy's $1M/$2M GL + $1M PL. It does clear the R.60-122 §302
   floor of $100K/$300K, but check whether any Medicaid/waiver contract or referral agreement demands a higher
   limit, and whether $750K aggregate is enough for a home health aide book.
3. **RENEWAL IS NOT GUARANTEED** — email states pricing is an estimate, *"coverage for the new policy period is
   not yet in force, and underwriters are not obligated to renew if additional information comes to light before
   the effective date."* So correcting the revenue figure could reprice it **or** cause a declination. Need a
   backup carrier conversation before 12/05, not after.
4. **Yearly underwriting review** — they explicitly re-examine eligibility annually.

### Revenue question still stands
Rated on **$25,000** gross revenue; biBERK WC payroll shows **~$434K**. Understating revenue is the fact pattern
that voids coverage on a claim — and NOW says so in writing.

## 🔍 NOW policy — LIKELY THE MIAMI FL VENTURE, not PHC (2026-10-21 11:02)

Larry: *"This may be another policy for the company he was trying to start in FL, im not sure."* The records back
that up, and it **reverses my "stale revenue figure" alarm.**

**Evidence it's the FL entity:**
1. Named insured = **"Prestigious Home Health"** → close cousin of **"PD Prestigious Home Health Care LLC", Miami FL**,
   the entity behind the unpaid CHAP invoice INV8079 ($4,133) that we flagged **DO NOT PAY** on 2026-08-31.
   (Note: "PD" likely = Pierre Dupree, member of Senator Transportation LLC, a Florida LLC filed 07/25/2025.)
2. **$25,000 revenue** is exactly what a **pre-revenue startup** rates at — a minimum-premium basis, not an error.
3. **$80.59/mo** is a small-agency/startup premium — not what a $434K-payroll SC agency would be quoted.
4. Program **Allied Healthcare · Home Health Agencies** matches a Miami home-health venture precisely.

**So the two risks are mutually exclusive:**
- **If FL** → revenue figure is fine; the exposure is paying ~$967/yr to insure a possibly-dormant company, and
  deciding whether the venture is alive. If dead → "Stop Automatic Renewal" in the dashboard + cancel (same call as CHAP).
- **If PHC** → name must be corrected to Prestigious Home Care, LLC AND the $25K basis flagged before binding.

**Decisive test:** log into https://app.nowinsurance.com/customer/dashboard (email on the policy is
prestigioushomecare1306@gmail.com) → declarations page shows the named insured's **address**.
**Miami FL → FL entity. Duncan SC → PHC.**

**PHC is not exposed either way** — USLI AH 1563617C carries GL $1M/$2M + PL $1M/$1M through 06/22/2027.
⚠️ Correction to my earlier note: the NOW certificate does **not** belong in binder Tab 6; Tab 6 wants the USLI ACORD.

## ✅ RESOLVED (2026-10-21 11:10) — NOW policy = FL entity, Miami address. CONFIRMED BY LARRY.

Larry: *"its for the FL company has a Miami address, still keep it in the reminders."*

**Settled facts:**
- **UIA-489481-120525 insures the FL / Miami entity — NOT Prestigious Home Care, LLC (SC).**
  Most likely *"PD Prestigious Home Health Care LLC"* (Miami FL), the same venture behind the unpaid CHAP
  invoice INV8079 ($4,133) flagged 2026-08-31.
- **The $25,000 gross-revenue figure is CORRECT as filed.** It is a pre-revenue / minimum-premium basis, not a
  stale error. ⚠️ **Retract the earlier "understated revenue" alarm — it does not apply to this policy.**
- **PHC (SC) is unaffected.** Its coverage is USLI AH 1563617C (GL $1M/$2M + PL $1M/$1M) through 06/22/2027.
- **This policy does NOT belong in PHC's compliance binder Tab 6.** Tab 6 needs the USLI ACORD, not this.

**The single open decision (deadline 12/05/2026):** is the Miami venture still operating?
- Alive → renew at ~$967/yr, and get written confirmation coverage for the new period is in force.
- Dormant → **"Stop Automatic Renewal"** in app.nowinsurance.com/customer/dashboard **before 12/05**, then confirm
  in writing. Auto-renewal does not stop by itself and will bill another full period.

**Reminders kept per Larry's instruction** (all 10:00 ET, delete-after-run, now worded with this decision):
`06ac0554` 11/05 · `3c8ead18` 11/28 · `49a4b20b` 12/04
