# 🎮 Tekken 6 — Native PC Port (Ekspym)

**Repo:** https://github.com/Ekspym/Tekken6-native-online · current build **v2.3.4** (2026-10-20)
Needs: own **Xbox 360 disc image — USA or Europe, Rev 1** (7.3–7.8 GB). Other versions refused by the builder.
Package contains **no game data**; BUILD GAME recompiles the game locally (~3–10 min). Windows 10/11 x64, DX12, ~10 GB free.
Launcher is **unsigned** → SmartScreen "More info → Run anyway". Verify release asset SHA-256 against GitHub API.

## ✅ CONTROLLER — the thing that ate a whole night (2026-10-21)
- Backend is **DirectInput (MMJoystick)**. Error in `runs\<mode>\tekken6.log`:
  `MMJoystick: device 1 not found (connect it before starting)`
- The game **enumerates input once at launch and never rescans**. Any change to the pad requires a game relaunch
  (Alt+F4 the game, hit PLAY again — the build is kept, no rebuild).
- **What finally worked: DS4Windows → profile → "Use DInput only" = ON** (stored as `<DinputOnly>True</DinputOnly>`
  in `%APPDATA%\DS4Windows\Profiles\Default.xml`). Default XInput emulation is **invisible** to this port.
- **Hit Box / arcade sticks work out of the box** — they register as DirectInput joysticks natively.
- Bluetooth DS4 alone did NOT register a usable device (device tree showed only `BTHENUM\...`, XInput all 4 slots
  "not connected"). Check with `xinput1_4.dll XInputGetState` + `HKCU:\...\Joystick\OEM` registry list.
- Mapping lives in `controls_mmjoystick.ini` (written by launcher → Settings → CONTROLLER; `Device = 1`).
  Terms are DInput: `POV Up`, `Button 1..13`, `X-`/`Y+`/`Z-`/`R+`.

## Paths (3060)
- Port: `H:\Games\Tekken6-Native-Online\Tekken6NativeOnline\`
- ISO (EUR Rev 1): `H:\Games\_scan_t6\Tekken 6 (Europe) (En,Ja,Fr,De,Es,It,Ko,Ru) (Rev 1).iso`
- Logs: `runs\practice_1\tekken6.log`, `native\build.log`

## Notes
- Community rollback netcode (GGPO principle) + launcher lobby. Both players need the **same package version**.
- PS3 alternative (Tekken6-rollback v1.2.5) needs a HEN-modded PS3 to dump BLUS30359 — Larry has the disc, not a console.
- Downloaded ISO checked 2026-10-20: zip CRC ok, single ISO inside, `default.xex` present, no bundled executables.
