# EVV / "Service Time" — Morning · Afternoon · Evening (researched 2026-09-24)

## The question
"If an aide clocks in at 3:00 AM, what time period is that?" — because an exception code fires when a
visit is outside the authorized service time, "but no one knows when service time is."

## Finding (verified against primary sources)
1. **SCDHHS never defines clock hours for morning/afternoon/evening.**
   - HCBS Provider Manual ("Authorization Periods," p.37) and CLTC Manual, identical wording:
     > "For personal care and companion services authorized by SCDHHS, the authorization will designate
     > the days of the week that the service is to be provided during the morning, afternoon, or evening.
     > If the authorization indicates multiple times of day this indicates that the participant requires
     > services more than one time a day."
   - Also: "The hours of service will be indicated only if specific times are essential to meeting the
     participant's service needs."
   - Grepped HCBS manual, CLTC manual, official forms, Care Call manual → **zero clock definitions.**
2. **SC's only published clock is "normal hours": 7:00 a.m. – 7:00 p.m., Monday–Friday.**
   - Source: SCDHHS **CM QA Question Crosswalk** (scdhhs.gov), EVV/Claims section:
     > "Were visits and monthly contacts conducted between the hours of 7 a.m. and 7 p.m., Monday through
     > [Friday]? If not, did the CM obtain approval from the Area Administrator and/or Central Office
     > Representative to make visits outside normal hours?"
   - Note: this is the **case manager** QA standard — an anchor, not necessarily the aide rule.
3. **SC's EVV system = AuthentiCare** (by First DataBank/Fiserv). SCDHHS has used it since **2002** for
   CLTC waivers; extended to DDSN waivers Dec 11, 2022. The CLTC "Care Call" web portal is the same
   EVV family. Sources: scdhhs.gov EVV launch communication; DDSN "ACR SC Mobile Instructions v.2.0".
4. **AuthentiCare has NO morning/afternoon/evening buckets.** It works in explicit clock times:
   - Scheduling requires a **start time and end time with AM/PM**.
   - Mobile app shows "Client Card" per **scheduled** EVV visit; "authorized service(s)" appear at top.
   - It does **not** block check-in outside the schedule; the visit is validated against the
     **authorization / authorized service period** afterward.
5. **Exception codes (SC EVV legend, per Care Call/CLTC guidance):**
   - **A1** = no authorization to match service delivery
   - **B** = **non-authorized service period** (service authorized for a specific time period but performed outside it)
   - **C1/C2** = missing check-in / check-out
   - **D/E/F** = billed hours/units under or over authorization
   (Legend surfaced via search; exact SC code table not yet pulled from a primary doc — verify.)

## Conclusion
Nobody defines the words — not SCDHHS, not EVV. **"Service time" is not something you look up; it's
something the provider *sets*.** The window = the authorization's listed times (if given) + the schedule
entered in AuthentiCare. If the authorization says only "morning," the schedule you enter *becomes* the
operative window.

## Recommended PHC practice
- Adopt a house table anchored to normal hours (7a–7p), e.g. Morning 7–11a · Afternoon 11a–4p · Evening 4–7p.
- Enter those windows as the AuthentiCare schedule per participant, matched to the authorization's
  time-of-day (and only one period unless the authorization says multiple).
- Outside the window → exception → document the reason (and get approval for outside normal hours).
- To confirm exactly how SC's build computes "non-authorized service period": SCDHHS EVV helpdesk
  (number circulating: 800-441-4667 — **verify** before relying) or AuthentiCare provider support.

## Open items
- [ ] Verify SC's official EVV exception code table (primary doc).
- [ ] Confirm how AuthentiCare SC computes code B (schedule vs authorization).
- [ ] Decide whether the house time table goes in the P&P manual (adds 1 page → master 117→118) or as a
      note on §5.4 (stays 117).