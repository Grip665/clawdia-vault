# Working Context

## Current State — Claude Feature Merge Complete (2026-07-22 00:15 EDT)

### What just happened
- Full feature merge from Claude: player engine fix, VOD/Series detail screens, EPG guide rewrite, login with server field + remember-me
- Session singleton system for runtime credential management
- Config refactored to use --dart-define (no hardcoded secrets)
- Pushed to GitHub, build running on Actions

### Active
- Waiting for GitHub Actions build to complete
- Need to test APK on phone once build finishes
- Hindsight + Obsidian vault + Graphify all healthy

### Notes
- Credentials in local env.json (gitignored): primep2.tv / larryg / iSup27wVvd
- GitHub tokens need refreshing (both expired)
- APK rebrand attempt (x24 → 4 Sight) was abandoned — Flutter route is the focus now