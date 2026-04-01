#!/bin/bash

LOG_FILE="$HOME/.cursor/logs/bash.log"
mkdir -p "$(dirname "$LOG_FILE")"

log() {
    local timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    echo "[$timestamp] $1" >> "$LOG_FILE"
}

log "Command: $1"
log "User: $USER"
log "Directory: $(pwd)"
log "---"
