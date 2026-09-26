# Working Context

**Updated:** 2026-09-25 10:26 EDT
**State:** ACTIVE — PHC weekly DPH reporting + HP disk health

## NOW
- ✅ **DONE (09:10):** updated weekly logs RE-SHIPPED to 3060 (Larry was on it). Caught+fixed a gap:
  the 8 AM run rebuilt docx but not PDFs → re-converted (159 docx/159 pdf) and re-uploaded
  (by-week 18 files, by-aide 25 dirs/300 files, md5 verified). ⚠️ Auto-save MUST re-convert PDFs next time.
- ✅ **DONE (10:22-10:26) — HP disk root cause fixed:** disk was 95% (5.1G). Cause = systemd --user crash
  loop flooding syslog (`openai-bridge` port-8765 duplicate, `zurg` Real-Debrid not premium → 4544 restarts,
  `rclone-mount` transitive) — 144,073 restart lines in syslog TODAY. Stopped all 3 (reversible) → flood
  stopped; voice ASR still up (manual pid 1011 owns 8765). Journal vacuum + syslog.1 truncate → **93%, 7.0G free**.
  ⏳ Needs Larry's OK: disable/mask zurg+rclone (else reboot resumes loop) + bigger reclaims (~18G candidates).

## DONE
- Weekly Care Service Log regrouped BY AIDE (employee-facing): 150 aide files / 25 aides + 9 combined.
  Shipped to 3060 `weekly_care_logs\{by-week, by-aide\<Aide>}` (pre-spacing-fix version).
- Signature block spacing fix (8 AM): Pt(5)→Pt(14) per aide line.

## PENDING
- Larry's OK on disk reclaims (uv cache 8.4G, CAROL pre-ai-tools-install tar 2.9G, old backup tars,
  backup-repo/.git 2.8G, Desktop/Billing-Training mp4s 1.9G) + whether to disable/mask zurg+rclone.
- Skill proposals awaiting Larry's apply/reject: `phc-weekly-care-service-log-20260925-97a3eb915b`,
  `phc-tasksheet-marks-extraction-20260925-b605f9dc66`.

## SKILLS
- UPDATE proposal pending (by-aide docs): `phc-weekly-care-service-log-20260925-7ebed7af0e`

## Prior (binder)
- PHC binder rev6 assembled; awaiting Larry's sign/date items F1-F4 + content decisions.
## ⏭️ PENDING ACTION FOR NEW SESSION (2026-09-25 11:05 EDT — Larry's request)
- Larry chose **option 1**: start a fresh session, then pin it to the **direct DeepSeek lane**.
- **DO THIS FIRST in the new session:** `session_status(sessionKey="current", model="deepseek/deepseek-flash")`.
  (Direct lane = 200k ctx ONLY — fresh session is fine/empty.)
- Also still pending (ask Larry): run the backup push (`~/clawdia-backup-repo` / `backup-clawdia.sh`) now that
  `~/.git-credentials` exists — today's backup is NOT on GitHub (remote=9 files/0.69G vs local 31 files/2.76G).
  After a confirmed push → delete ~5.7G of redundant local copies (tarball + staging chunks).
