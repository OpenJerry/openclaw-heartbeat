#!/bin/bash
# check_and_commit.sh
# Checks system health and commits result to the public openclaw-heartbeat repo.

REPO_DIR="/home/hendrik/.openclaw/workspace/repos/openclaw-heartbeat"
STATUS_FILE="$REPO_DIR/STATUS.md"
TIMESTAMP=$(date -u +"%Y-%m-%d %H:%M:%S UTC")

# 1. Get Disk Usage
DISK_INFO=$(df -h / | tail -n 1)

# 2. Check for Issues (e.g., disk less than 10G)
AVAILABLE_GB=$(echo "$DISK_INFO" | awk '{print $4}' | sed 's/G//')
STATUS="🟢 OK: All systems nominal."
if (( $(echo "$AVAILABLE_GB < 10" | bc -l) )); then
    STATUS="🔴 ALERT: Disk space below 10GB. Requires attention!"
fi

# 3. Write Status to STATUS.md
echo "# Heartbeat Status Report" > "$STATUS_FILE"
echo "## 🦉 Last Checked: $TIMESTAMP" >> "$STATUS_FILE"
echo "" >> "$STATUS_FILE"
echo "**Status:** $STATUS" >> "$STATUS_FILE"
echo "" >> "$STATUS_FILE"
echo "### System Health (df -h /)" >> "$STATUS_FILE"
echo "\`\`\`" >> "$STATUS_FILE"
echo "$DISK_INFO" >> "$STATUS_FILE"
echo "\`\`\`" >> "$STATUS_FILE"

# 4. Commit and Push
cd "$REPO_DIR" || exit 1
git config user.email "hendrikopenclaw@gmail.com"
git config user.name "JerryTheOpenClawOwl"
git add STATUS.md
git commit -m "HEARTBEAT: $STATUS ($TIMESTAMP)"
git push origin main
