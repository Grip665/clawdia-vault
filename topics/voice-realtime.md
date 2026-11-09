# Voice — Real-Time Conversation (Clawdia)

**Status:** ACTIVE — paused 2026-11-08 15:06 by Larry, starting a new session. Resume from here.
**Goal:** talk out loud to Clawdia as a conversation, not typing. Must sound like *her*, not Google.
**User:** Larry (Greenville County SC). Secondary lane wanted for **Vance / Hermes** on the 3060.

---

## Decisions locked in

1. **Native speech-to-speech is rejected on identity grounds.** Gemini Live native audio is fast (~0.5 s) but the
   voice IS Google's. Larry: *"I want it to be you, your voice."* So the mouth must be a cascade TTS we control.
2. **Build our own rather than plug into OpenClaw's built-in Talk.** The built-in path can only produce
   provider voices. The app will be a standalone voice agent with a swappable brain.
3. **Stack choice:** Pipecat (or LiveKit Agents) as the framework — both are open source, pluggable LLM, VAD,
   barge-in, WebRTC. Decision pending: compare both, or go straight to Pipecat (my pick).
4. **Build order: Kokoro first, cloned voice second.** Get the latency right with a fast voice, then swap.
   Doing it backwards makes it impossible to tell whether slowness is the pipeline or the model.
5. **Voice plan:** design the Clawdia voice once with Gemini TTS (prompt-described), save the audio, then
   clone that output with Chatterbox (MIT) or Qwen3-TTS (Apache 2.0). Legal — cloning our own generated audio.
   ⚠️ XTTS v2 is **non-commercial** licensed — avoid if anything ever ships.
   ⚠️ Never clone a real person's voice without consent.

## Verified facts (tested, not assumed)

- `GEMINI_API_KEY` present in env and **works** for the Live API.
- Live sessions open with `setupComplete` + `responseModalities:["AUDIO"]` for BOTH:
  - `gemini-2.5-flash-native-audio-preview-12-2025` (OpenClaw's documented default)
  - `gemini-2.5-flash-native-audio-latest`
- **OpenClaw 2026.6.6 ships stale realtime aliases** — these all 404 (error 1008): `gemini-live-2.5-flash-preview`,
  `gemini-live-2.5-flash`, `gemini-2.5-flash-preview-native-audio-dialog`, `gemini-2.0-flash-live-001`.
- **Anthropic has no native realtime speech-to-speech API** — verified. Claude can be brain, never voice.
- Larry has **no ChatGPT subscription** → Codex-OAuth / OpenAI-Realtime-on-subscription path is dead.
- **Gemini TTS works** on the key: `gemini-2.5-flash-preview-tts`, `gemini-2.5-pro-preview-tts`,
  `gemini-3.1-flash-tts-preview`, `gemini-3.8-flash-tts`, `gemini-3.8-flash-lite-tts`.
  Sample clips generated at `~/.openclaw/media/out/gem_{Kore,Puck,Aoede,Charon}.wav`.
- **edge-tts is installed but BROKEN** — 403 from Microsoft's endpoint (client-token rejection). Fixable by
  upgrading the package. 324 voices available once fixed.
- **OpenClaw `talk` schema (2026.6.6) real keys:** `provider`, `providers`, `realtime`, `consultThinkingLevel`,
  `consultFastMode`, `speechLocale`, `interruptOnSpeech`, `silenceTimeoutMs`. `additionalProperties:false` —
  unknown keys fail the load. `consultThinkingLevel`/`consultFastMode` are top-level, NOT under `realtime`.
  Fields that DO NOT exist: `toolPolicy`, `consultPolicy`, `agentContext`, `activityHandling`, `turnCoverage`,
  `startSensitivity`, `sessionResumption`, `contextWindowCompression`.
- **Azure Voice Live is NOT an RE target** — documented API, MIT samples (`Azure-Samples/cognitive-services-speech-sdk`,
  3.4k stars). The native engine is closed; the voices are trained models and cannot be reversed at any effort.
  Azure BYOM with Claude = separate Azure-metered bill, not Larry's Claude subscription.

## Voice measurements (Gemini TTS, same sentence)

| Voice | Median F0 | Read |
|---|---|---|
| Kore | 208.7 Hz | Female, brighter, clearer |
| Aoede | 200.0 Hz | Female, warmer, slightly lower → **recommended base** |
| Puck | 146.8 Hz | Mid, bright |
| Charon | 134.1 Hz | Male, deep |

Larry's own preference: the female voices (Kore / Aoede).

## Latency model — the thing to beat

Target: **end of speech → first audible syllable.**

| Stage | Budget |
|---|---|
| Endpointing + final transcript | 300–500 ms |
| LLM first token (DeepSeek) | 500–900 ms ← weak link |
| TTS first audio chunk | 150–400 ms |
| **Total** | **~1.2–1.8 s** |

Reference points: Gemini native ~0.5 s · typing a sentence 5–10 s. So the cascade is ~4–6× faster than typing
but ~3× slower than native. **The rule that cannot bend: every stage streams, TTS speaks clause one while the
rest generates.** Any stage that waits for completion = the old `voice-dash` failure.

⚠️ No trustworthy first-chunk benchmarks exist for Chatterbox / XTTS / Kokoro. **Measure, don't quote.**

## Local assets

- `~/voice-dash/` — July 2026 Node voice dashboard. **Stop-and-wait** (push-to-talk, whole file, whole reply).
  This is why it felt slower than typing. Reusable: gateway WS auth, browser UI, Edge TTS. Pipeline shape: do not reuse.
- `~/tools/hermes-talk/` — cloned MIT reference implementation (Python). Real duplex speech-to-speech with tool
  calls and background delegation. Its `talk_auth.py` is itself a **port of OpenClaw's own auth**, and
  `talk_live_config.py` cites OpenClaw commit `76378ddb`. Read: `talk_gemini_realtime.py`,
  `talk_endpointing_benchmark.py` (174 lines), `talk_speech_timing.py` (50 lines — the measurement tools we want).
- 3060 (RTX 3060, 6 GB) — host for Kokoro / Chatterbox / faster-whisper. Not needed for Gemini Live native.
- `GEMINI_API_KEY` in env. `codex` CLI: **not installed.**
- Design brief handed to Claude: `~/.openclaw/workspace/VOICE-BRIEF-FOR-CLAUDE.md`

## Vance's lane (separate, not shared)

Vance = Hermes on the 3060. His lane is `hermes-talk` (MIT, installs on Hermes Agent ≥0.21.7). Two agents,
two lanes, no collision. He can use the same `GEMINI_API_KEY`. Larry explicitly wants this kept separate.

## Next action (when resumed)

1. Pull Pipecat and LiveKit Agents, or go straight to Pipecat (recommended).
2. Scaffold: mic → VAD → streaming STT → DeepSeek → Kokoro streaming TTS → speaker, with barge-in
   and echo cancellation (headphones assumed).
3. Instrument every stage with timestamps; print the five numbers + **clip rate**.
4. Run the acceptance test: "what's on my calendar tomorrow" + mid-answer "actually make it Thursday."
5. Only then swap Kokoro → cloned Clawdia voice and re-measure.

## Open questions

- Free or paid Gemini tier? Cannot be detected from the API. Check aistudio.google.com → API keys, or Cloud
  Console → Billing. Free tier trains on data → **voice is non-PHI only** until paid.
- Does `speakerVoice` / per-reply `{"voice":...}` directive reach realtime sessions, or only the TTS path?
- Which STT: Gemini Live as the ears (outputs text), or faster-whisper on the 3060?
- Pipecat vs LiveKit — undecided.

## Hard lines

- **No PHI or client details through any third-party voice provider.** Social-work case context is in this agent.
- Free tiers train on your data → disqualified for anything sensitive.
- No wake word, no telephony, no dictation — Larry ruled those out.
