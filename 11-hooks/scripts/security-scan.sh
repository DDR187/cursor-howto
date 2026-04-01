#!/bin/bash
set -e

FILE_PATH="$1"

if [[ -z "$FILE_PATH" ]]; then
    echo "Error: No file path provided"
    exit 0
fi

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] [security-scan] $1"
}

log "Scanning: $FILE_PATH"

ISSUES=0

if grep -E "(password|secret|api_key|token|private_key)\s*=\s*['\"]" "$FILE_PATH" 2>/dev/null; then
    log "⚠️  Warning: Potential hardcoded secret found"
    ((ISSUES++))
fi

if grep -E "eval\s*\(" "$FILE_PATH" 2>/dev/null; then
    log "⚠️  Warning: eval() usage detected - potential code injection risk"
    ((ISSUES++))
fi

if grep -E "innerHTML\s*=" "$FILE_PATH" 2>/dev/null; then
    log "⚠️  Warning: innerHTML assignment - potential XSS risk"
    ((ISSUES++))
fi

if grep -E "document\.write\s*\(" "$FILE_PATH" 2>/dev/null; then
    log "⚠️  Warning: document.write() - potential XSS risk"
    ((ISSUES++))
fi

if grep -E "SELECT\s+\*\s+FROM" "$FILE_PATH" 2>/dev/null; then
    log "⚠️  Warning: SELECT * usage - consider specifying columns"
    ((ISSUES++))
fi

if [[ $ISSUES -gt 0 ]]; then
    log "Found $ISSUES potential security issue(s)"
else
    log "No security issues found"
fi

exit 0
