---
name: Documentation Generator
description: Automatically generate API documentation and code documentation
triggers:
  - type: command
    command: "/docs"
  - type: command
    command: "/generate-docs"
---

# Documentation Generator Skill

## Overview

Automatically analyze code and generate documentation:

- API interface documentation
- Function/method documentation
- Type definition documentation
- Usage examples

---

## Documentation Types

### 1. API Documentation

Auto-generated from API routes:

- Endpoint description
- Request parameters
- Response format
- Error codes

### 2. Function Documentation

Generated from code comments:

- Function description
- Parameter description
- Return value description
- Usage examples

### 3. Type Documentation

Generated from TypeScript types:

- Interface definitions
- Type descriptions
- Property descriptions

---

## Output Format

```markdown
# API Documentation

## {endpoint_name}

**Endpoint**: `{method} {path}`

### Description
{description}

### Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| {param} | {type} | {required} | {description} |

### Request Example

```json
{
  "{param}": "{value}"
}
```

### Response Format

| Field | Type | Description |
|-------|------|-------------|
| {field} | {type} | {description} |

### Response Example

```json
{
  "{field}": "{value}"
}
```

### Error Codes

| Status Code | Description |
|-------------|-------------|
| {code} | {description} |
```

---

## Usage Example

```
User: /docs src/api/users.ts

AI: Generating API documentation...

# Users API Documentation

## Get User List

**Endpoint**: `GET /api/users`

### Description
Get a list of all users, supports pagination and filtering.

### Request Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| page | number | No | Page number, default 1 |
| limit | number | No | Items per page, default 10 |
| search | string | No | Search keyword |

### Response Format

| Field | Type | Description |
|-------|------|-------------|
| data | User[] | User list |
| total | number | Total count |
| page | number | Current page number |

...
```
