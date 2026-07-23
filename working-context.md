# Working Context

## Current State — Build #51 Running (2026-07-22 22:57 EDT)

### What happened this session
- **Build #48** — Fixed channel freeze: bypass GuideScreen, go directly to PlayerScreen. SUCCESS. Channels play.
- **Back button behavior** — non-home tabs go to Home, Home tab has double-tap to exit with toast
- **Server auto-fill** — baked-in server defaults now pre-fill on login
- **Dashboard overflow fixed** — removed Spacer(), responsive LayoutBuilder tiles scale down in landscape
- **Player control row** — wrapped in FittedBox to prevent overflow
- **Build #49** failed (clipBehavior not available on CI Flutter version)
- **Build #50** succeeded (back button + server fix + clipBehavior removed)
- **Build #51** running (responsive LayoutBuilder tiles)

### Active
- **Build #51** is running on GitHub Actions — responsive tile fix for landscape overflow
- Larry is designing a new home page mockup to replace the current dashboard
- Video live feed on panels is wanted but will be added with the new design

### What's been accomplished
- Flutter app works: login, channel grid, video playback, player overlay
- 7-tab bottom nav: Home, Live TV, Guide, Movies, Series, Account, Settings
- Channels play when tapped (hero preview + grid)
- Back button navigates correctly
- Server address auto-fills

### Next
- Larry will share a home page mockup
- Implement new design + add video preview to Live TV tile
- Add VOD/Series browsing (Movies & Series tabs)
- Polish: EPG guide, favorites, settings

### Notes
- Credentials: primep2.tv / larryg / iSup27wVvd
- APK builds via GitHub Actions (no local Flutter SDK)
- Decompiled x24 APK at /tmp/4sight-repackage/ (abandoned route)
- Working APK link: https://litter.catbox.moe/89krsb.apk (Build #50)
- Build #51 link when ready: needs download from GitHub artifacts