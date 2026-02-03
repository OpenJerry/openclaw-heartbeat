# Heartbeat Status Report
## 🦉 Last Checked: 2026-02-03 10:05:07 UTC

**Status:** 🟢 OK: All systems nominal.

### 💾 Disk Health (df -h /)
```
/dev/mapper/ubuntu--vg-ubuntu--lv   62G   13G   47G  21% /
```

### 🧠 Memory Usage (free -h)
```
Mem:          7.8Gi       798Mi       635Mi       1.0Mi       6.4Gi       6.7Gi
```

### 📈 Uptime & Load Average
```
 10:05:07 up 22:50,  2 users,  load average: 0.02, 0.06, 0.01
```

### ⚙️ Processes
Running Processes: **154**

### 🦞 OpenClaw Runtime Status
```
OpenClaw status

Overview
┌─────────────────┬───────────────────────────────────────────────────────────────────────────────────────────────────┐
│ Item            │ Value                                                                                             │
├─────────────────┼───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Dashboard       │ http://127.0.0.1:18789/                                                                           │
│ OS              │ linux 5.4.0-216-generic (x64) · node 22.22.0                                                      │
│ Tailscale       │ off                                                                                               │
│ Channel         │ stable (default)                                                                                  │
│ Update          │ available · pnpm · npm update 2026.2.1                                                            │
│ Gateway         │ local · ws://127.0.0.1:18789 (local loopback) · reachable 33ms · auth token · openclaw (192.168.  │
│                 │ 18.182) app unknown linux 5.4.0-216-generic                                                       │
│ Gateway service │ systemd installed · enabled · running (pid 60727, state active)                                   │
│ Node service    │ systemd not installed                                                                             │
│ Agents          │ 1 · no bootstraps · sessions 6 · default main active just now                                     │
│ Memory          │ 6 files · 24 chunks · dirty · sources memory · plugin memory-core · vector ready · fts ready ·    │
│                 │ cache on (24)                                                                                     │
│ Probes          │ skipped (use --deep)                                                                              │
│ Events          │ none                                                                                              │
│ Heartbeat       │ 30m (main)                                                                                        │
│ Sessions        │ 6 active · default gemini-flash-latest (1049k ctx) · ~/.openclaw/agents/main/sessions/sessions.   │
│                 │ json                                                                                              │
└─────────────────┴───────────────────────────────────────────────────────────────────────────────────────────────────┘

Security audit
Summary: 1 critical · 1 warn · 1 info
  CRITICAL Elevated exec allowlist contains wildcard
    tools.elevated.allowFrom.webchat includes "*" which effectively approves everyone on that channel for elevated mode.
  WARN Reverse proxy headers are not trusted
    gateway.bind is loopback and gateway.trustedProxies is empty. If you expose the Control UI through a reverse proxy, configure trusted proxies so local-client c…
    Fix: Set gateway.trustedProxies to your proxy IPs or keep the Control UI local-only.
Full report: openclaw security audit
Deep probe: openclaw security audit --deep

Channels
┌──────────┬─────────┬────────┬───────────────────────────────────────────────────────────────────────────────────────┐
│ Channel  │ Enabled │ State  │ Detail                                                                                │
├──────────┼─────────┼────────┼───────────────────────────────────────────────────────────────────────────────────────┤
│ Telegram │ ON      │ OK     │ token config (8499…TZpk · len 46) · accounts 1/1                                      │
└──────────┴─────────┴────────┴───────────────────────────────────────────────────────────────────────────────────────┘

Sessions
┌──────────────────────────────────────────────────────────┬────────┬──────────┬─────────────────────┬────────────────┐
│ Key                                                      │ Kind   │ Age      │ Model               │ Tokens         │
├──────────────────────────────────────────────────────────┼────────┼──────────┼─────────────────────┼────────────────┤
│ agent:main:main                                          │ direct │ just now │ gemini-flash-latest │ 67k/1049k (6%) │
│ agent:main:cron:d6379119-aa72-4…                         │ direct │ 4m ago   │ gemini-flash-latest │ 30k/1049k (3%) │
│ agent:main:cron:e07e4931-0ff3-4…                         │ direct │ 5m ago   │ gemini-flash-latest │ 31k/1049k (3%) │
│ agent:main:cron:112b9477-4921-4…                         │ direct │ 26m ago  │ gemini-flash-latest │ 19k/1049k (2%) │
│ agent:main:subagent:b715d665-ef…                         │ direct │ 28m ago  │ gemini-flash-latest │ 17k/1049k (2%) │
│ agent:main:cron:2964fb0e-d8ea-4…                         │ direct │ 22h ago  │ gemini-flash-latest │ 31k/1049k (3%) │
└──────────────────────────────────────────────────────────┴────────┴──────────┴─────────────────────┴────────────────┘

FAQ: https://docs.openclaw.ai/faq
Troubleshooting: https://docs.openclaw.ai/troubleshooting

Update available (npm 2026.2.1). Run: openclaw update

Next steps:
  Need to share?      openclaw status --all
  Need to debug live? openclaw logs --follow
  Need to test channels? openclaw status --deep
```

