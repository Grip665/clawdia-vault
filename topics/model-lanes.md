# Model lanes on the HP (canon, 2026-11-08)

## Primary
deepseek/deepseek-flash (direct API). Balance was $4.87 on 2026-11-08 — top up or it silently fails over.

## Fallback chain (effective, verified via config.get)
1. google/gemini-3-flash-preview   (uses env GEMINI_API_KEY)
2. anthropic/claude-sonnet-5-5     (runs through the local Claude Code CLI, OAuth — NO API key)
3. openrouter/deepseek/deepseek-v4.1-flash

## The Claude lane (2026.11.2 and later)
- agents.defaults.cliBackends is GONE. The bundled anthropic plugin owns the harness.
- Correct wiring is model-scoped:
  agents.defaults.models["anthropic/claude-sonnet-5-5"].agentRuntime = { id: "claude-cli" }
- Auth is owned by the CLI itself: claude auth login (PTY; paste the OAuth code). Check with claude auth status --text.
- Current login: Claude Pro account, org Larry, grip694@gmail.com.
- Verified by a real in-gateway turn: [agent/cli-backend] provider=claude-cli, returned cli-lane-ok in 13.6s.
- Cost/behavior: each turn spawns the CLI. ~13s for a trivial reply. Fallback lane, not a daily driver.
- Legacy "claude-cli/<model>" refs still work but new config should use provider/model + agentRuntime.

## Restart safety (learned the hard way, 2026-11-08)
- systemd drop-in ~/.config/systemd/user/openclaw-gateway.service.d/restart-grace.conf sets TimeoutStopSec=330, KillMode=mixed.
  Shutdown legitimately needs ~2 min to stop the hindsight daemon; the old 30s limit killed it mid-shutdown and left a stuck "suspension" state that refused every node connection.
- After ANY OpenClaw upgrade: set plugins.entries.voice-call.config.agentId (or the gateway suspends), check the journal for "gateway suspension", and re-approve the phone node (upgrade invalidates node approval).

## Do not
- Do not upgrade the HP casually. Larry's standing rule: explicit maintenance window first.
- Do not trust openclaw doctor --fix on this box; it hangs at 0% at the banner. Use openclaw config validate.
