#!/bin/bash
set -e

FILE_PATH="$1"

if [[ -z "$FILE_PATH" ]]; then
    echo "Error: No file path provided"
    exit 1
fi

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] [format-code] $1"
}

log "Formatting: $FILE_PATH"

if [[ "$FILE_PATH" == *.ts || "$FILE_PATH" == *.tsx ]]; then
    if command -v npx &> /dev/null; then
        npx prettier --write "$FILE_PATH" 2>/dev/null || true
        log "Formatted with Prettier"
    fi
elif [[ "$FILE_PATH" == *.py ]]; then
    if command -v black &> /dev/null; then
        black "$FILE_PATH" 2>/dev/null || true
        log "Formatted with Black"
    fi
elif [[ "$FILE_PATH" == *.go ]]; then
    if command -v gofmt &> /dev/null; then
        gofmt -w "$FILE_PATH" 2>/dev/null || true
        log "Formatted with gofmt"
    fi
fi

log "Done"
exit 0
