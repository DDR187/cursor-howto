#!/bin/bash
set -e

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] [pre-commit] $1"
}

log "Running pre-commit checks..."

log "Running tests..."
if npm test 2>/dev/null; then
    log "✅ Tests passed"
else
    log "❌ Tests failed"
    exit 1
fi

log "Running linter..."
if npm run lint 2>/dev/null; then
    log "✅ Lint passed"
else
    log "❌ Lint failed"
    exit 1
fi

log "Running type check..."
if npm run typecheck 2>/dev/null; then
    log "✅ Type check passed"
else
    log "❌ Type check failed"
    exit 1
fi

log "All checks passed!"
exit 0
