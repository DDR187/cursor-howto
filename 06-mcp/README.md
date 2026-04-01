# 06. MCP Integration

> **Level:** Intermediate+ | **Time:** 1 hour | **Prerequisites:** Cursor installed

---

## Table of Contents

- [Overview](#overview)
- [What is MCP](#what-is-mcp)
- [How It Works](#how-it-works)
- [Configuring MCP](#configuring-mcp)
- [Common MCP Servers](#common-mcp-servers)
- [Practical Examples](#practical-examples)
- [Best Practices](#best-practices)
- [Troubleshooting](#troubleshooting)

---

## Overview

MCP (Model Context Protocol) is an open standard protocol that enables Cursor to:

- Connect to external data sources
- Call external tools
- Access real-time information
- Extend AI capabilities

```mermaid
flowchart TB
    A[Cursor] --> B[MCP Protocol]
    B --> C[GitHub]
    B --> D[Database]
    B --> E[File System]
    B --> F[API Services]
    B --> G[Custom Tools]
    
    C --> H[PR/Issue Management]
    D --> I[Data Queries]
    E --> J[File Operations]
    F --> K[API Calls]
    G --> L[Extended Features]
```

---

## What is MCP

### Definition

MCP (Model Context Protocol) is an open standard protocol introduced by Anthropic for connecting AI models with external tools and data sources.

### Core Concepts

```mermaid
flowchart LR
    subgraph Host["MCP Host (Cursor)"]
        H[AI Assistant]
    end
    
    subgraph Protocol["MCP Protocol"]
        P[Standardized Communication]
    end
    
    subgraph Servers["MCP Servers"]
        S1[GitHub Server]
        S2[Database Server]
        S3[File Server]
    end
    
    H <--> P
    P <--> S1
    P <--> S2
    P <--> S3
```

### What MCP Can Do

| Capability | Description | Example |
|------------|-------------|---------|
| **Resource Access** | Read external data | Read database, files |
| **Tool Calling** | Execute operations | Create PR, send messages |
| **Prompts** | Provide templates | Code review templates |

---

## How It Works

### MCP Architecture

```mermaid
sequenceDiagram
    participant U as User
    participant C as Cursor
    participant MCP as MCP Protocol
    participant S as MCP Server
    participant E as External Service
    
    U->>C: Request needs external data
    C->>MCP: Query available tools
    MCP->>S: List tools
    S->>MCP: Return tool list
    MCP->>C: Available tools
    
    C->>MCP: Call tool
    MCP->>S: Execute request
    S->>E: API call
    E->>S: Return data
    S->>MCP: Return result
    MCP->>C: Provide data
    C->>U: Complete
```

### Tool Discovery

1. Cursor scans configured MCP servers at startup
2. Each server reports its provided tools
3. AI can call these tools when needed

---

## Configuring MCP

### Configuration File Location

```
project-root/
├── .cursor/
│   └── mcp.json        # Project-level MCP config
└── ...

user-directory/
└── .cursor/
    └── mcp.json        # Global MCP config
```

### Configuration Format

```json
{
  "mcpServers": {
    "github": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-github"],
      "env": {
        "GITHUB_TOKEN": "your_token_here"
      }
    },
    "database": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-postgres"],
      "env": {
        "DATABASE_URL": "postgresql://user:pass@localhost:5432/db"
      }
    }
  }
}
```

### Adding MCP Servers

#### Method 1: Command Line

```bash
# GitHub MCP
claude mcp add github -- npx -y @modelcontextprotocol/server-github

# PostgreSQL MCP
claude mcp add postgres -- npx -y @modelcontextprotocol/server-postgres
```

#### Method 2: Manual Configuration

Edit `.cursor/mcp.json` file.

---

## Common MCP Servers

### GitHub MCP

```json
{
  "mcpServers": {
    "github": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-github"],
      "env": {
        "GITHUB_TOKEN": "${GITHUB_TOKEN}"
      }
    }
  }
}
```

**Features:**
- Search repositories
- Create/Update Issues
- Create/Update PRs
- Read file contents

### PostgreSQL MCP

```json
{
  "mcpServers": {
    "postgres": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-postgres"],
      "env": {
        "DATABASE_URL": "postgresql://..."
      }
    }
  }
}
```

**Features:**
- Execute SQL queries
- View table structure
- Data analysis

### Filesystem MCP

```json
{
  "mcpServers": {
    "filesystem": {
      "command": "npx",
      "args": [
        "-y",
        "@modelcontextprotocol/server-filesystem",
        "/path/to/allowed/directory"
      ]
    }
  }
}
```

**Features:**
- Read/write files
- Create directories
- Search files

### Slack MCP

```json
{
  "mcpServers": {
    "slack": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-slack"],
      "env": {
        "SLACK_BOT_TOKEN": "xoxb-..."
      }
    }
  }
}
```

**Features:**
- Send messages
- Read channel messages
- Search messages

---

## Practical Examples

### Example 1: GitHub PR Management

```
User: Show all unmerged PRs in my repository

AI (using GitHub MCP):
Querying GitHub...

Found 3 unmerged PRs:

1. #123 - Add user authentication feature
   Author: @user1
   Created: 2024-01-15
   Status: Waiting for review

2. #124 - Fix login bug
   Author: @user2
   Created: 2024-01-14
   Status: Has conflicts

3. #125 - Update documentation
   Author: @user3
   Created: 2024-01-13
   Status: Needs changes
```

### Example 2: Database Query

```
User: Query the number of users registered in the past week

AI (using PostgreSQL MCP):
Querying database...

Query results:
- Users registered in past 7 days: 1,234
- Daily average: 176
- Peak day: 2024-01-18 (245 users)

Detailed data:
| Date       | Registrations |
|------------|---------------|
| 2024-01-19 | 189           |
| 2024-01-18 | 245           |
| 2024-01-17 | 167           |
| ...        | ...           |
```

### Example 3: Automated Workflow

```
User: Create a PR for this issue

AI (using GitHub MCP):
1. Read Issue #126 content
2. Analyze required modifications
3. Create new branch
4. Generate code modifications
5. Create PR

PR #127 created:
Title: Fix user avatar upload issue
Link: https://github.com/xxx/pull/127
```

---

## Best Practices

### ✅ Do's

1. **Use environment variables** - Don't hardcode sensitive information
2. **Limit permissions** - Grant only necessary permissions
3. **Test connections** - Verify MCP works after configuration
4. **Document** - Record MCP servers used in project
5. **Version control** - Include config in Git (exclude sensitive info)

### ❌ Don'ts

1. **Hardcode tokens** - Use environment variables
2. **Over-permission** - Grant only necessary permissions
3. **Ignore errors** - Check MCP connection status
4. **Commit sensitive info** - Use .gitignore to exclude

### Secure Configuration

```json
{
  "mcpServers": {
    "github": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-github"],
      "env": {
        "GITHUB_TOKEN": "${GITHUB_TOKEN}"
      }
    }
  }
}
```

```bash
# Set environment variables
export GITHUB_TOKEN="your_token_here"

# Or in .env file
GITHUB_TOKEN=your_token_here
```

---

## Troubleshooting

### MCP Connection Failed

**Symptoms:** AI cannot use MCP tools

**Solutions:**
1. Check if MCP server is correctly installed
2. Verify environment variables are set
3. Check network connection
4. View Cursor logs

### Permission Errors

**Symptoms:** MCP tools return permission errors

**Solutions:**
1. Check if token is valid
2. Verify token permission scope
3. Regenerate token

### Performance Issues

**Symptoms:** MCP calls are slow

**Solutions:**
1. Reduce unnecessary MCP servers
2. Optimize query statements
3. Check network latency

---

## Next Steps

- [07. Advanced Features](../07-advanced-features/) - Explore advanced features
- [08. Best Practices](../08-best-practices/) - Learn workflows
- [09. Skills](../09-skills/) - Create custom skills

---

<p align="center">
  <a href="../README.md">Back to Home</a> | <a href="github-mcp.json">GitHub MCP Config</a> | <a href="database-mcp.json">Database MCP Config</a>
</p>
