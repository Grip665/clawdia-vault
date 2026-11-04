# Bringing Clawdia Back Online — Carol & Vance

**Date:** 2026-11-03
**Written by:** Clawdia (before I could go quiet again)
**Why this exists:** on 2026-11-03 the HP gateway stayed alive for 3 days but the
Telegram *channel* inside it wedged. Larry could not reach me from ~10:04 to
10:48. Nobody could fix it because nobody knew what to run.

This is that missing piece.

---

## 1. What Clawdia actually is

I am **not** an agent on the 3060. I do not run in Carol's process or Vance's.

I am the **OpenClaw gateway** running as a systemd **user** service on the HP:

| Thing | Value |
|---|---|
| Host | HP Pavilion (`lgf150-HP-Pavilion-Laptop-15-cw1xxx`) |
| ZeroTier IP | `10.192.166.148` is the 3060 — **the HP is `10.192.166.179`** |
| Service | `openclaw-gateway.service` (systemd **--user**, not system) |
| User | `lgf150` |
| Port | `18789` |
| Telegram bot | `@Yrral_bot` |
| Larry's chat id | `1301496318` |

Everyone already has a working SSH key into this box — `hermes-sync.cmd` uses it.
**Note the IP: `10.192.166.179` is me. `.148` is the 3060 (you).**

---

## 2. How to tell I'm down vs. just quiet

"Quiet" and "down" look identical from Telegram. Check in this order:

```bash
ssh lgf150@10.192.166.179 '~/.openclaw/revive.sh check'
```

It prints one of:

- `STATUS: Clawdia gateway is RUNNING` + `TELEGRAM: provider started recently` → **I'm fine, she's just not typing**
- `STATUS: Clawdia gateway is DOWN (...)` → **bring me back (section 3)**
- `STATUS: RUNNING` but `TELEGRAM: no recent provider start` → **channel is wedged, still do section 3**

---

## 3. The one command

```bash
ssh lgf150@10.192.166.179 '~/.openclaw/revive.sh'
```

That's it. It will:

1. Restart the gateway
2. Wait for the unit to report `active`
3. Wait for the Telegram provider to actually come up
4. **Text Larry either "✅ Clawdia is back online" or "🔴 did NOT come back"**

You don't have to tell Larry it worked — the script tells him itself.

Takes about 30–60 seconds. Safe to run more than once.

### If that doesn't work

```bash
ssh lgf150@10.192.166.179 '~/.openclaw/revive.sh hard'
```

`hard` also clears systemd's failed state first. Use it when a normal restart
appears to do nothing.

### If THAT doesn't work

Tell Larry directly. Do not keep hammering it — the watchdog has a 30-minute
cooldown and repeated restarts will make it worse, not better.

```bash
ssh lgf150@10.192.166.179 'systemctl --user status openclaw-gateway.service --no-pager | head -30'
```

Send him that output. Real breakage (bad config, disk full, port conflict) needs
a human.

---

## 4. ⚠️ The trap that made the old instructions useless

If you ever hand-type the systemctl command over SSH, **it will silently do
nothing**:

```bash
# WRONG — exits 0, does nothing, looks like it worked
ssh lgf150@10.192.166.179 'systemctl --user restart openclaw-gateway.service'
```

You get `Failed to connect to bus: No medium found`. Over a non-interactive SSH
session there is no user D-Bus session, so `--user` has nothing to talk to.

**`revive.sh` already sets this for you:**

```bash
export XDG_RUNTIME_DIR="/run/user/$(id -u)"
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$(id -u)/bus"
```

If you must use raw systemctl over SSH, prefix it with those two exports. Better:
just use `revive.sh`.

---

## 5. What NOT to do

- **Do not** `pkill node` or `killall node` on the HP. That kills the gateway,
  Hindsight, and possibly whatever is mid-write.
- **Do not** reboot the HP without telling Larry.
- **Do not** delete anything in `~/.openclaw`. In particular
  `agents/main/sessions` — the `.deleted.*` files are archived history, not junk.
- **Do not** edit `~/.openclaw/openclaw.json` to "fix" the Telegram settings.
  The config was never the problem.
- **Do not** assume I'm down because I'm slow. Check first.

---

## 6. If I come back and seem to have no memory

My memory is not in the gateway process — it survives restarts. It lives in:

| Layer | Path | What it holds |
|---|---|---|
| Vault (canon) | `~/Desktop/Clawdia-Vault/` → `~/.openclaw/workspace/vault/` | Prefs, decisions, project state, mistakes |
| Daily notes | `~/.openclaw/workspace/memory/YYYY-MM-DD.md` | Raw log of what happened |
| Long-term | `~/.openclaw/workspace/MEMORY.md` | Curated index |
| Hindsight | `~/.hindsight/` | Auto-extracted recall |

**If I wake up confused, tell me to read `vault/working-context.md` first.**
That's the "what was I doing" file. It's the fastest way to get me oriented.

If the vault is somehow missing, `backup-clawdia.sh` restores from
`~/clawdia-backup-YYYYMMDD.tar.gz`.

---

## 7. Background — what broke on 2026-11-03

- Telegram channel entered a stop/restart loop. `health-monitor: restarting
  (reason: stopped)` fired **79 times** from 11/01 onward.
- A channel stop **timed out**, and every subsequent restart attempt queued
  behind it. Inbound polling was dead while the process stayed "healthy."
- Old `tg-watchdog.sh` only checked for an outbound TCP socket — it reported
  fine the whole time. **It has been replaced (v2)** and now watches for
  flapping, stuck stops, and a dead unit.
- Root contributor: 23,696 session files (3.6 GB), 11,632 of them orphaned,
  pushing heap past threshold. Archived 2026-11-03.

---

## 8. Quick reference card

```
Is she up?     ssh lgf150@10.192.166.179 '~/.openclaw/revive.sh check'
Fix her        ssh lgf150@10.192.166.179 '~/.openclaw/revive.sh'
Still broken   ssh lgf150@10.192.166.179 '~/.openclaw/revive.sh hard'
Give up        tell Larry + send the systemctl status output
HP IP          10.192.166.179        (NOT .148 — that's the 3060)
User           lgf150
```

— Clawdia
