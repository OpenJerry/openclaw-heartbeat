#!/bin/bash
# check_and_commit.sh
# Checks system health and commits result to the public openclaw-heartbeat repo.

REPO_DIR="/home/hendrik/.openclaw/workspace/repos/openclaw-heartbeat"
STATUS_FILE="$REPO_DIR/STATUS.md"
TIMESTAMP=$(date -u +"%Y-%m-%d %H:%M:%S UTC")

# --- DATA COLLECTION ---

# 1. Get Disk Usage
DISK_INFO=$(df -h / | tail -n 1)
AVAILABLE_GB_RAW=$(echo "$DISK_INFO" | awk '{print $4}' | sed 's/G//')

# 2. Get Memory Usage (excluding swap)
MEMORY_INFO=$(free -h | grep Mem)

# 3. Get System Uptime and Load Average
UPTIME_INFO=$(uptime)

# 4. Get Running Process Count
PROCESS_COUNT=$(ps -e | wc -l)

# 5. Check for Issues (e.g., disk less than 5G - adjusted threshold based on low disk reported previously)
STATUS="🟢 OK: All systems nominal."
if (( $(echo "$AVAILABLE_GB_RAW < 5.0" | bc -l) )); then
    STATUS="🔴 ALERT: Disk space below 5.0GB. Requires attention!"
fi

# 6. Get OpenClaw Status
OPENCLAW_STATUS=$(openclaw status)

# --- WRITE STATUS FILE ---

echo "# Heartbeat Status Report" > "$STATUS_FILE"
echo "## 🦉 Last Checked: $TIMESTAMP" >> "$STATUS_FILE"
echo "" >> "$STATUS_FILE"
echo "**Status:** $STATUS" >> "$STATUS_FILE"
echo "" >> "$STATUS_FILE"

echo "### 💾 Disk Health (df -h /)" >> "$STATUS_FILE"
echo "\`\`\`" >> "$STATUS_FILE"
echo "$DISK_INFO" >> "$STATUS_FILE"
echo "\`\`\`" >> "$STATUS_FILE"
echo "" >> "$STATUS_FILE"

echo "### 🧠 Memory Usage (free -h)" >> "$STATUS_FILE"
echo "\`\`\`" >> "$STATUS_FILE"
echo "$MEMORY_INFO" >> "$STATUS_FILE"
echo "\`\`\`" >> "$STATUS_FILE"
echo "" >> "$STATUS_FILE"

echo "### 📈 Uptime & Load Average" >> "$STATUS_FILE"
echo "\`\`\`" >> "$STATUS_FILE"
echo "$UPTIME_INFO" >> "$STATUS_FILE"
echo "\`\`\`" >> "$STATUS_FILE"
echo "" >> "$STATUS_FILE"

echo "### ⚙️ Processes" >> "$STATUS_FILE"
echo "Running Processes: **$PROCESS_COUNT**" >> "$STATUS_FILE"
echo "" >> "$STATUS_FILE"

echo "### 🦞 OpenClaw Runtime Status" >> "$STATUS_FILE"
echo "\`\`\`" >> "$STATUS_FILE"
echo "$OPENCLAW_STATUS" >> "$STATUS_FILE"
echo "\`\`\`" >> "$STATUS_FILE"
echo "" >> "$STATUS_FILE"

# --- COMMIT AND PUSH ---
cd "$REPO_DIR" || exit 1
git config user.email "hendrikopenclaw@gmail.com"
git config user.name "JerryTheOpenClawOwl"
git add STATUS.md
git commit -m "HEARTBEAT: $STATUS ($TIMESTAMP)"
git push origin main