# Working Context

## Current
- **ViewComfy + ComfyUI setup (July 26-27):** 
  - Node.js upgraded to v26.5.0 on 3060
  - ViewComfy cloned to Desktop, npm install done, configured for ComfyUI port 8001
  - ViewComfy running on http://localhost:3000 (detached via wmic)
  - Need a text-to-image workflow JSON exported from ComfyUI for ViewComfy to use

## Active
- ViewComfy setup needs workflow JSON
- Flutter doctor still needs to run on 3060
- 4Sight home page mockup pending from Larry

## What's been accomplished
- Flutter app works: login, channel grid, video playback, player overlay, 7-tab bottom nav
- 3060 dev tools installed: VS Code, Android Studio, Flutter SDK v3.29.2, pen.dev, ViewComfy
- Node.js upgraded to v26.5.0
- Disk cleanup: removed language packs, portable ComfyUI (1.94GB + extracted)
- HP laptop shell replacement options researched

## Next
- [ ] Check Build #51 result on GitHub Actions
- [ ] Run Flutter doctor on 3060, fix any issues
- [ ] Create/export text-to-image workflow JSON for ViewComfy (from ComfyUI Desktop)
- [ ] Larry's home page mockup → implement
- [ ] Finish 4Sight (VOD, EPG, landing page, payments)
- [ ] Rebuild Visual Therapy

## Notes
- Credentials: primep2.tv / larryg / iSup27wVvd
- APK builds via GitHub Actions (will also build locally on 3060 now)
- Working APK link: https://litter.catbox.moe/89krsb.apk (Build #50)
- ComfyUI Desktop API running on 127.0.0.1:8001 (--listen --port 8001 --enable-manager)
- ViewComfy at http://localhost:3000, configured with COMFYUI_API_URL=127.0.0.1:8001
- WMIC process call create is the only reliable way to start detached background processes via SSH on Windows