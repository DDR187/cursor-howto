#!/bin/bash
set -e

TASK="$1"
STATUS="$2"

if [[ -z "$SLACK_WEBHOOK_URL" ]]; then
    echo "SLACK_WEBHOOK_URL not set, skipping notification"
    exit 0
fi

MESSAGE="*Cursor Task Completed*
Task: $TASK
Status: $STATUS
Time: $(date '+%Y-%m-%d %H:%M:%S')"

curl -X POST "$SLACK_WEBHOOK_URL" \
    -H 'Content-Type: application/json' \
    -d "{\"text\": \"$MESSAGE\"}" \
    2>/dev/null || true

exit 0
