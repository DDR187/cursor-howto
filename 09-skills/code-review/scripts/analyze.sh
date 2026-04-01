#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"

echo "=== Code Review Analysis ==="
echo "Project: $PROJECT_ROOT"
echo "Time: $(date '+%Y-%m-%d %H:%M:%S')"
echo ""

analyze_file() {
    local file="$1"
    local issues=0
    
    echo "Analyzing: $file"
    
    if grep -E "(password|secret|api_key|token)\s*=\s*['\"]" "$file" 2>/dev/null; then
        echo "  ⚠️  Potential hardcoded secret found"
        ((issues++))
    fi
    
    if grep -E "eval\(|Function\(" "$file" 2>/dev/null; then
        echo "  ⚠️  Potential code injection risk"
        ((issues++))
    fi
    
    if grep -E "innerHTML\s*=" "$file" 2>/dev/null; then
        echo "  ⚠️  Potential XSS risk with innerHTML"
        ((issues++))
    fi
    
    echo "  Issues found: $issues"
    echo ""
}

if [ -n "$1" ]; then
    analyze_file "$1"
else
    find "$PROJECT_ROOT/src" -type f \( -name "*.ts" -o -name "*.tsx" -o -name "*.js" -o -name "*.jsx" \) 2>/dev/null | while read -r file; do
        analyze_file "$file"
    done
fi

echo "=== Analysis Complete ==="
