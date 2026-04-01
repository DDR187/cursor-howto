---
name: Code Review
description: Automatic code review, checking code quality, security, and best practices
triggers:
  - type: command
    command: "/review"
  - type: command
    command: "/code-review"
---

# Code Review Skill

## Overview

Automatically review code and provide improvement suggestions, covering:

- Code quality analysis
- Security vulnerability detection
- Performance issue identification
- Best practice recommendations

---

## Review Items

### 1. Code Quality

| Check Item | Description |
|------------|-------------|
| Naming Conventions | Are variable, function, and class names clear |
| Code Structure | Does it follow single responsibility principle |
| Comment Completeness | Are key logic sections commented |
| Code Duplication | Is there duplicate code |
| Complexity | Are functions too complex |

### 2. Security Check

| Check Item | Description |
|------------|-------------|
| SQL Injection | Is parameterized query used |
| XSS Vulnerability | Is output properly escaped |
| Sensitive Information | Are keys or credentials exposed |
| Input Validation | Is user input validated |
| Permission Check | Is permission verification performed |

### 3. Performance Check

| Check Item | Description |
|------------|-------------|
| Loop Optimization | Are there unnecessary operations in loops |
| Memory Leaks | Are resources properly released |
| Async Handling | Is async used correctly |
| Cache Usage | Is caching used reasonably |

### 4. Best Practices

| Check Item | Description |
|------------|-------------|
| Error Handling | Are errors handled properly |
| Type Safety | Are type definitions used |
| Test Coverage | Are there corresponding tests |
| Documentation Complete | Is necessary documentation present |

---

## Execution Steps

1. **Analyze Code Structure**
   - Identify file type
   - Parse code structure
   - Extract key information

2. **Run Check Rules**
   - Apply quality rules
   - Apply security rules
   - Apply performance rules

3. **Generate Report**
   - Summarize issues
   - Categorize by severity
   - Provide fix suggestions

---

## Output Format

```markdown
# Code Review Report

## Overview
- File: {filename}
- Review Time: {timestamp}
- Total Issues: {total_issues}

## Issue List

### 🔴 High ({high_count})

| Location | Issue | Suggestion |
|----------|-------|------------|
| {location} | {issue} | {suggestion} |

### 🟡 Medium ({medium_count})

| Location | Issue | Suggestion |
|----------|-------|------------|
| {location} | {issue} | {suggestion} |

### 🟢 Low ({low_count})

| Location | Issue | Suggestion |
|----------|-------|------------|
| {location} | {issue} | {suggestion} |

## Statistics

| Category | Count |
|----------|-------|
| Security Issues | {security_count} |
| Performance Issues | {performance_count} |
| Code Quality | {quality_count} |
| Best Practices | {practice_count} |

## Recommendations

{recommendations}
```

---

## Usage Example

```
User: /review src/utils/auth.ts

AI: Reviewing src/utils/auth.ts...

# Code Review Report

## Overview
- File: src/utils/auth.ts
- Review Time: 2024-01-15 10:30:00
- Total Issues: 3

## Issue List

### 🔴 High (1)

| Location | Issue | Suggestion |
|----------|-------|------------|
| Line 45 | Hardcoded secret | Use environment variable to store secret |

### 🟡 Medium (1)

| Location | Issue | Suggestion |
|----------|-------|------------|
| Line 23 | Missing input validation | Add email format validation |

### 🟢 Low (1)

| Location | Issue | Suggestion |
|----------|-------|------------|
| Line 12 | Missing function comment | Add JSDoc comment |

## Recommendations

1. Move hardcoded secret to environment variable
2. Add input validation middleware
3. Add documentation comments for public functions
```

---

## Configuration Options

```json
{
  "codeReview": {
    "severity": {
      "security": "high",
      "performance": "medium",
      "quality": "low"
    },
    "exclude": [
      "**/*.test.ts",
      "**/*.spec.ts"
    ],
    "rules": {
      "no-hardcoded-secrets": true,
      "no-sql-injection": true,
      "require-input-validation": true
    }
  }
}
```
