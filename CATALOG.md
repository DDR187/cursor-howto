# Cursor Feature Catalog

> Complete reference for all features, with installation commands and quick links

---

## Quick Navigation

| Feature | Description | Folder | Install Command |
|---------|-------------|--------|-----------------|
| [Shortcuts](#01-shortcuts) | Inline edit, Chat, Composer | [01-shortcuts/](01-shortcuts/) | No installation needed |
| [Rules](#02-rules) | Persistent context rules | [02-rules/](02-rules/) | Copy config files |
| [Codebase Indexing](#03-codebase-indexing) | Project understanding capability | [03-codebase-indexing/](03-codebase-indexing/) | Auto-enabled |
| [Chat](#04-chat) | AI conversation Q&A | [04-chat/](04-chat/) | No installation needed |
| [Composer](#05-composer) | Multi-file editing | [05-composer/](05-composer/) | No installation needed |
| [MCP](#06-mcp) | External tool integration | [06-mcp/](06-mcp/) | Configure MCP servers |
| [Advanced Features](#07-advanced-features) | Plan Mode, Parallel Agents | [07-advanced-features/](07-advanced-features/) | Enable via config |
| [Best Practices](#08-best-practices) | Workflow and team collaboration | [08-best-practices/](08-best-practices/) | Reference guide |
| [Skills](#09-skills) | Reusable capability modules | [09-skills/](09-skills/) | Copy to project |
| [Subagents](#10-subagents) | Specialized AI assistants | [10-subagents/](10-subagents/) | Copy to project |
| [Hooks](#11-hooks) | Event-driven automation | [11-hooks/](11-hooks/) | Configure scripts |
| [Plugins](#12-plugins) | Feature packaging | [12-plugins/](12-plugins/) | One-click install |

---

## 01. Shortcuts

**Location:** [01-shortcuts/](01-shortcuts/)

**Core Shortcuts:**

| Feature | Mac | Windows |
|---------|-----|---------|
| Inline Edit | `Cmd+K` | `Ctrl+K` |
| Chat Panel | `Cmd+L` | `Ctrl+L` |
| Composer | `Cmd+I` | `Ctrl+I` |
| Command Palette | `Cmd+Shift+P` | `Ctrl+Shift+P` |

**Detailed Documentation:** [README.md](01-shortcuts/README.md) | [Cheatsheet](01-shortcuts/shortcuts-cheatsheet.md)

---

## 02. Rules

**Location:** [02-rules/](02-rules/)

**Rules Hierarchy:**

| Type | Location | Scope |
|------|----------|-------|
| User Rules | `~/.cursor/rules/` | All projects |
| Project Rules | `.cursor/rules/` | Current project |
| .cursorrules | Project root | Current project (deprecated) |

**Installation:**

```bash
# Project Rules
cp 02-rules/project-.cursorrules /path/to/project/.cursorrules

# Frontend Rules
cp 02-rules/frontend-rules.mdc /path/to/project/.cursor/rules/

# Backend Rules
cp 02-rules/backend-rules.mdc /path/to/project/.cursor/rules/
```

**Detailed Documentation:** [README.md](02-rules/README.md)

---

## 03. Codebase Indexing

**Location:** [03-codebase-indexing/](03-codebase-indexing/)

**Configuration:**

```json
// .cursor/settings.json
{
  "cursor.codebaseIndexing": {
    "include": ["src/**/*"],
    "exclude": ["node_modules/**", "dist/**"]
  }
}
```

**Exclude Files:**

```gitignore
# .cursorignore
node_modules/
dist/
*.min.js
```

**Detailed Documentation:** [README.md](03-codebase-indexing/README.md)

---

## 04. Chat

**Location:** [04-chat/](04-chat/)

**Shortcut:** `Cmd+L` (Mac) / `Ctrl+L` (Windows)

**Reference Syntax:**

| Syntax | Function |
|--------|----------|
| `@filename` | Reference file |
| `#symbol` | Reference symbol |
| Selected code | Auto reference |

**Detailed Documentation:** [README.md](04-chat/README.md)

---

## 05. Composer

**Location:** [05-composer/](05-composer/)

**Shortcut:** `Cmd+I` (Mac) / `Ctrl+I` (Windows)

**Use Cases:**

- New feature development
- Module refactoring
- Batch modifications
- Code migration

**Best Practices:**

- Modify 2-4 files at a time
- Describe tasks clearly
- Use snapshots to rollback

**Detailed Documentation:** [README.md](05-composer/README.md)

---

## 06. MCP

**Location:** [06-mcp/](06-mcp/)

**Configuration File:** `.cursor/mcp.json`

**Common MCP Servers:**

```json
{
  "mcpServers": {
    "github": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-github"],
      "env": {
        "GITHUB_TOKEN": "${GITHUB_TOKEN}"
      }
    },
    "postgres": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-postgres"],
      "env": {
        "DATABASE_URL": "${DATABASE_URL}"
      }
    }
  }
}
```

**Detailed Documentation:** [README.md](06-mcp/README.md)

---

## 07. Advanced Features

**Location:** [07-advanced-features/](07-advanced-features/)

**Feature List:**

| Feature | Description |
|---------|-------------|
| Plan Mode | Plan first, execute later |
| Parallel Agents | Multi-task parallelism |
| Background Tasks | Long-running operations |
| Permission Mode | Automation control |
| Headless Mode | CI/CD integration |
| Session Management | Multi-session management |

**Headless Mode Example:**

```bash
cursor -p "Review this project" --output-format json
```

**Detailed Documentation:** [README.md](07-advanced-features/README.md)

---

## 08. Best Practices

**Location:** [08-best-practices/](08-best-practices/)

**Workflow:**

```
Requirements → Plan Mode → Composer → Testing → Review → Commit
```

**Team Configuration:**

```
Project Root/
├── .cursor/
│   ├── rules/
│   ├── skills/
│   ├── agents/
│   └── settings.json
├── .cursorrules
└── .cursorignore
```

**Detailed Documentation:** [README.md](08-best-practices/README.md)

---

## 09. Skills

**Location:** [09-skills/](09-skills/)

**Structure:**

```
.cursor/skills/
└── skill-name/
    ├── SKILL.md
    ├── scripts/
    └── templates/
```

**Installation:**

```bash
cp -r 09-skills/code-review /path/to/project/.cursor/skills/
```

**Detailed Documentation:** [README.md](09-skills/README.md)

---

## 10. Subagents

**Location:** [10-subagents/](10-subagents/)

**Configuration:**

```
.cursor/agents/
├── code-reviewer.md
├── test-engineer.md
└── doc-writer.md
```

**Installation:**

```bash
cp 10-subagents/templates/*.md /path/to/project/.cursor/agents/
```

**Detailed Documentation:** [README.md](10-subagents/README.md)

---

## 11. Hooks

**Location:** [11-hooks/](11-hooks/)

**Configuration:**

```json
// ~/.cursor/settings.json
{
  "hooks": {
    "PreToolUse": [{
      "matcher": "Write",
      "hooks": ["~/.cursor/hooks/format-code.sh"]
    }]
  }
}
```

**Installation:**

```bash
mkdir -p ~/.cursor/hooks
cp 11-hooks/scripts/*.sh ~/.cursor/hooks/
chmod +x ~/.cursor/hooks/*.sh
```

**Detailed Documentation:** [README.md](11-hooks/README.md)

---

## 12. Plugins

**Location:** [12-plugins/](12-plugins/)

**Installation:**

```bash
# From marketplace
Command Palette → "Cursor: Install Plugin"

# From local
cp -r /path/to/plugin ~/.cursor/plugins/
```

**Creating Plugin:**

```
my-plugin/
├── plugin.json
├── rules/
├── skills/
├── agents/
├── hooks/
└── mcp/
```

**Detailed Documentation:** [README.md](12-plugins/README.md)

---

## Feature Comparison Table

| Feature | Trigger Method | Persistence | Best Use |
|---------|----------------|-------------|----------|
| Shortcuts | Manual | Session | Quick operations |
| Rules | Auto | Cross-session | Project standards |
| Skills | Auto/Command | File system | Automated tasks |
| Subagents | Auto delegation | Isolated context | Specialized tasks |
| MCP | Auto query | Real-time | External data |
| Hooks | Event trigger | Configuration | Automated validation |
| Plugins | One-click install | All features | Complete solutions |

---

## Installation Quick Reference

```bash
# Rules
cp 02-rules/*.mdc .cursor/rules/

# Skills
cp -r 09-skills/code-review .cursor/skills/

# Subagents
cp 10-subagents/templates/*.md .cursor/agents/

# Hooks
mkdir -p ~/.cursor/hooks
cp 11-hooks/scripts/*.sh ~/.cursor/hooks/
chmod +x ~/.cursor/hooks/*.sh

# MCP
export GITHUB_TOKEN="your_token"
# Edit .cursor/mcp.json

# Plugins
/plugin install pr-review
```

---

<p align="center">
  <a href="README.md">Back to Home</a>
</p>
