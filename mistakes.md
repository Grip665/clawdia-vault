# Mistakes Log

**Format:** `YYYY-MM-DD — What happened — What I learned`

## 2026-09-01 — False “missing disaster plan” flag
- Told Larry the binder was missing an agency-level disaster plan form (Tab 4 references D-1/D-2/D-1C but Claude's forms pack only has Attachment E). Larry: "I thought we already had the disaster plan." He was right — **PHC-Disaster-Plan.docx** (built 8/31, branded) already contains **Form D-1 (Agency Disaster Plan), Form D-2 (Emergency Numbers & Notification Log), and Form D-1C (client copy + acknowledgment)** — effective 8/31/2026, review 8/31/2027, Nurse Supervisor Chanelle Allen RN. It was sitting in the compliance folder + 3060 the whole time.
  → **Fix:** Corrected to Larry; no action needed — Tab 4 fully covered.
  → **Lesson:** Before flagging a "missing form," CHECK THE EXISTING DOCUMENTS in the compliance folders (Disaster-Plan-Forms/, Employee Files - Compliance/) — not just Claude's latest pack. I only looked at the new forms pack and forgot the standalone Disaster Plan doc. When in doubt, unzip and read the docx before telling Larry something's missing.

## 2026-09-01 — "Connecticut DPH" label in Claude package PROMPT
- I wrote the cover note in `DPH_Compliance_Claude_Package/PROMPT.md` calling Prestigious Home Care "a Connecticut DPH-licensed home care agency." Wrong — the agency is **South Carolina** (SC DPH, R.60-122, SLED/IdentoGO, Mauldin/Greenville, S.C. Code §43-35). Claude caught the mismatch and, correctly, refused to ignore it — treated it as a template artifact and built the redesign as SC.
  → **Fix:** PROMPT.md now says South Carolina (both references); zip re-packaged.
  → **Lesson:** Always state jurisdiction from primary sources (vault, regs, checklists) — never from assumption. If I'd copied the SC reg citation into the prompt the first time, Claude wouldn't have had to flag it. When building compliance packages, jurisdiction is a load-bearing detail: double-check before sending.

## 2026-07-13
- **Memory wipe** — Context pruning during long Vegas session wiped 9.9MB of trajectory. Had to reconstruct from logs.
  → **Fix:** Implemented Phase 1 Hindsight tuning + Phase 2 Obsidian vault. Now writing to vault mid-session.

## 2026-07-11
- **Hindsight over-reliance** — Assumed Hindsight auto-recall would preserve session context during long conversations. It didn't — context pruning killed mid-session continuity.
  → **Lesson:** Write comprehensive daily notes. Don't rely on Hindsight for mid-session recall. Trajectory logs are the fallback.

## 2026-07-05
- **Automated exam answering** — Built scripts that read questions from DOM but used keyword matching instead of understanding the content. Failed 7 out of 8 tests.
  → **Lesson:** Manual analysis of all 20 questions first → then submit. Reading slides first saves time.

## ~2026-07-02
- **CAROL exception codes** — Listed two codes with comma instead of "and" (e.g., "E, D" instead of "E and D").
  → **Fix:** Template corrected.

- **Atomic wallet** — Sent crypto from Coinbase to Atomic wallet, exposing the address to Coinbase.
  → **Lesson:** Atomic is "burned." Use fresh wallets going forward.

## 2026-06-19
- **Service Plan save** — Almost saved the Complete/Sign page which would've locked everything without Area Office review.
  → **Fix:** Never save Complete/Sign page unless explicitly told to.
## 2026-08-10 — 📖 Mistaken Identity Chapter 1
- **Routing bug** — agents.list had only `carol` with no bindings, so ALL DMs silently routed to Carol's engine. Carol loaded the shared identity files (IDENTITY.md=Clawdia), so she answered as Clawdia. Larry chatted for a long stretch thinking he was talking to me; he felt something was off ("you didn't sound like yourself").
  → **Fix:** Added `main` (Clawdia, general) as default + explicit telegram binding to `main`; kept `carol` as Phoenix-only with strict allowlist. Routing now explicit. Gateway restarted.
  → **Lesson:** (1) Every bound agent needs its OWN explicit identity block — never rely on shared identity files to disambiguate. (2) If a user says "you don't sound like yourself," check routing/identity FIRST — their gut is usually right. (3) Capabilities follow the engine, not the name tag — general tasks were hitting Carol's restricted toolset.
  → **Action item:** Give Carol her own unique interface/persona/panel so she's visibly Carol (Larry's suggestion). Low priority, quiet-slot task.

## 2026-08-08
- **Recent-conversation memory miss** — Larry messaged "Yo" and asked if I remembered what we'd just been talking about; I had no trace of the conversation between the 2 PM auto-save and 18:09 because context pruning trimmed it before it was logged.
  → **Lesson:** The gap is between *last file save* and *now*. Fix: log conversations to `memory/2026-08-08.md` + working-context more aggressively during active chats (not just at scheduled saves), or set a mid-session save cron/heartbeat while chatting. Existing vault/heartbeat system saves 2 AM/8 AM/2 PM/10 PM — not enough for active evening sessions.

## 2026-08-12 — Companion scope effective date (initially wrong)
- I resolved the SCDHHS Companion (Agency) Services scope effective date to **7/1/2024**, reasoning from the PDF's internal "July 1, 2024" footer + the 7/1/2025 bulletin not listing Companion.
- A follow-up agent reviewed the PRIMARY docs and corrected it: the live **7-1-25** doc carries a substantive 7/1/2025 change (family-caregiver exclusion → "legally responsible adult or legal guardian"), confirmed verbatim by the official **7/1/2025 HCBS training deck**. The footer is a stale template artifact.
- **Lesson:** the in-document footer vs. hosted-filename conflict was real, but I over-weighted the footer and the bulletin's (incomplete) summary list, and under-weighted the actual body content + training deck. Correct determination = **7/1/2025**.
- Fixed in participant-folder-contents.md §J, memory/2026-08-12.md, and this log.

## 2026-09-09 — Wrote scratch scripts to over-verify a CAROL SP fill
- After `carol_fill_sp_disciplines.js` ran FULL SP CHAIN COMPLETE for Genette Knuckles, I created 3 ad-hoc scripts (sp_probe_ids.js, sp_verify_fast.js, sp_verify_goals_safe.js) to "double-check" rather than trusting the canonical script output.
- Larry: "this is why we use CAROL protocol so you don't have to guess or make new processes." Correct.
- **Fix:** Deleted all 3. Protocol rule: canonical scripts only; script output = truth; Larry reviews the form. Only exception to write anything new: Larry explicitly asks.

## 2026-09-09 — Wrong SC APS hotline + broken MC questions in SCDHHS Training Kit
- **What:** Built the SCDHHS Training Kit; my Session A reading had SC APS hotline as 1-800-898-2850 (WRONG — real number is 1-888-227-3487 / 1-888-CARE4US, SC DSS). Also, quiz questions phrased as "Which of these is neglect?" printed no answer options — aides literally couldn't answer them.
- **Who caught it:** Claude (Larry's other AI) reviewed the kit zip.
- **Why:** Wrote the phone number from memory/pattern instead of verifying against dss.sc.gov. Quiz format used "best answer" questions but only shipped the questions, not the options.
- **Fix:** Deployed Claude's FIXED version (options added to all MC questions, APS number corrected, Session I dementia added so the kit covers BOTH regulators' topic lists). Memory logged.
- **Rule:** Any phone number, citation, or regulatory reference in client-facing docs gets verified against a live source before shipping. Any multiple-choice question MUST have its options printed on the same page as the question.
