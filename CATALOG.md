# Cursor 功能目录

> 所有功能的完整参考，附带安装命令和快速链接

---

## 快速导航

| 功能 | 描述 | 文件夹 | 安装命令 |
|------|------|--------|----------|
| [快捷键](#01-快捷键) | 内联编辑、聊天、Composer | [01-shortcuts/](01-shortcuts/) | 无需安装 |
| [Rules](#02-rules) | 持久化上下文规则 | [02-rules/](02-rules/) | 复制配置文件 |
| [代码库索引](#03-代码库索引) | 项目理解能力 | [03-codebase-indexing/](03-codebase-indexing/) | 自动启用 |
| [聊天](#04-聊天) | AI 对话问答 | [04-chat/](04-chat/) | 无需安装 |
| [Composer](#05-composer) | 多文件编辑 | [05-composer/](05-composer/) | 无需安装 |
| [MCP](#06-mcp) | 外部工具集成 | [06-mcp/](06-mcp/) | 配置 MCP 服务器 |
| [高级功能](#07-高级功能) | Plan Mode、并行 Agents | [07-advanced-features/](07-advanced-features/) | 配置启用 |
| [最佳实践](#08-最佳实践) | 工作流和团队协作 | [08-best-practices/](08-best-practices/) | 参考指南 |
| [Skills](#09-skills) | 可复用能力模块 | [09-skills/](09-skills/) | 复制到项目 |
| [Subagents](#10-subagents) | 专用 AI 助手 | [10-subagents/](10-subagents/) | 复制到项目 |
| [Hooks](#11-hooks) | 事件驱动自动化 | [11-hooks/](11-hooks/) | 配置脚本 |
| [Plugins](#12-plugins) | 功能打包 | [12-plugins/](12-plugins/) | 一键安装 |

---

## 01. 快捷键

**位置：** [01-shortcuts/](01-shortcuts/)

**核心快捷键：**

| 功能 | Mac | Windows |
|------|-----|---------|
| 内联编辑 | `Cmd+K` | `Ctrl+K` |
| 聊天面板 | `Cmd+L` | `Ctrl+L` |
| Composer | `Cmd+I` | `Ctrl+I` |
| 命令面板 | `Cmd+Shift+P` | `Ctrl+Shift+P` |

**详细文档：** [README.md](01-shortcuts/README.md) | [速查表](01-shortcuts/shortcuts-cheatsheet.md)

---

## 02. Rules

**位置：** [02-rules/](02-rules/)

**Rules 层级：**

| 类型 | 位置 | 作用范围 |
|------|------|----------|
| User Rules | `~/.cursor/rules/` | 所有项目 |
| Project Rules | `.cursor/rules/` | 当前项目 |
| .cursorrules | 项目根目录 | 当前项目（即将弃用）|

**安装：**

```bash
# 项目 Rules
cp 02-rules/project-.cursorrules /path/to/project/.cursorrules

# 前端 Rules
cp 02-rules/frontend-rules.mdc /path/to/project/.cursor/rules/

# 后端 Rules
cp 02-rules/backend-rules.mdc /path/to/project/.cursor/rules/
```

**详细文档：** [README.md](02-rules/README.md)

---

## 03. 代码库索引

**位置：** [03-codebase-indexing/](03-codebase-indexing/)

**配置：**

```json
// .cursor/settings.json
{
  "cursor.codebaseIndexing": {
    "include": ["src/**/*"],
    "exclude": ["node_modules/**", "dist/**"]
  }
}
```

**排除文件：**

```gitignore
# .cursorignore
node_modules/
dist/
*.min.js
```

**详细文档：** [README.md](03-codebase-indexing/README.md)

---

## 04. 聊天

**位置：** [04-chat/](04-chat/)

**快捷键：** `Cmd+L` (Mac) / `Ctrl+L` (Windows)

**引用语法：**

| 语法 | 功能 |
|------|------|
| `@filename` | 引用文件 |
| `#symbol` | 引用符号 |
| 选中代码 | 自动引用 |

**详细文档：** [README.md](04-chat/README.md)

---

## 05. Composer

**位置：** [05-composer/](05-composer/)

**快捷键：** `Cmd+I` (Mac) / `Ctrl+I` (Windows)

**适用场景：**

- 新功能开发
- 模块重构
- 批量修改
- 代码迁移

**最佳实践：**

- 每次修改 2-4 个文件
- 明确描述任务
- 使用快照回滚

**详细文档：** [README.md](05-composer/README.md)

---

## 06. MCP

**位置：** [06-mcp/](06-mcp/)

**配置文件：** `.cursor/mcp.json`

**常用 MCP 服务器：**

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

**详细文档：** [README.md](06-mcp/README.md)

---

## 07. 高级功能

**位置：** [07-advanced-features/](07-advanced-features/)

**功能列表：**

| 功能 | 描述 |
|------|------|
| Plan Mode | 先规划后执行 |
| 并行 Agents | 多任务并行 |
| 后台任务 | 长时间运行 |
| 权限模式 | 自动化控制 |
| 无头模式 | CI/CD 集成 |
| 会话管理 | 多会话管理 |

**无头模式示例：**

```bash
cursor -p "审查这个项目" --output-format json
```

**详细文档：** [README.md](07-advanced-features/README.md)

---

## 08. 最佳实践

**位置：** [08-best-practices/](08-best-practices/)

**工作流：**

```
需求 → Plan Mode → Composer → 测试 → 审查 → 提交
```

**团队配置：**

```
项目根目录/
├── .cursor/
│   ├── rules/
│   ├── skills/
│   ├── agents/
│   └── settings.json
├── .cursorrules
└── .cursorignore
```

**详细文档：** [README.md](08-best-practices/README.md)

---

## 09. Skills

**位置：** [09-skills/](09-skills/)

**结构：**

```
.cursor/skills/
└── skill-name/
    ├── SKILL.md
    ├── scripts/
    └── templates/
```

**安装：**

```bash
cp -r 09-skills/code-review /path/to/project/.cursor/skills/
```

**详细文档：** [README.md](09-skills/README.md)

---

## 10. Subagents

**位置：** [10-subagents/](10-subagents/)

**配置：**

```
.cursor/agents/
├── code-reviewer.md
├── test-engineer.md
└── doc-writer.md
```

**安装：**

```bash
cp 10-subagents/templates/*.md /path/to/project/.cursor/agents/
```

**详细文档：** [README.md](10-subagents/README.md)

---

## 11. Hooks

**位置：** [11-hooks/](11-hooks/)

**配置：**

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

**安装：**

```bash
mkdir -p ~/.cursor/hooks
cp 11-hooks/scripts/*.sh ~/.cursor/hooks/
chmod +x ~/.cursor/hooks/*.sh
```

**详细文档：** [README.md](11-hooks/README.md)

---

## 12. Plugins

**位置：** [12-plugins/](12-plugins/)

**安装：**

```bash
# 从市场安装
命令面板 → "Cursor: Install Plugin"

# 从本地安装
cp -r /path/to/plugin ~/.cursor/plugins/
```

**创建 Plugin：**

```
my-plugin/
├── plugin.json
├── rules/
├── skills/
├── agents/
├── hooks/
└── mcp/
```

**详细文档：** [README.md](12-plugins/README.md)

---

## 功能对比表

| 功能 | 触发方式 | 持久性 | 最佳用途 |
|------|----------|--------|----------|
| 快捷键 | 手动 | 会话 | 快速操作 |
| Rules | 自动 | 跨会话 | 项目规范 |
| Skills | 自动/命令 | 文件系统 | 自动化任务 |
| Subagents | 自动委托 | 隔离上下文 | 专用任务 |
| MCP | 自动查询 | 实时 | 外部数据 |
| Hooks | 事件触发 | 配置 | 自动化验证 |
| Plugins | 一键安装 | 所有功能 | 完整方案 |

---

## 安装快速参考

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
# 编辑 .cursor/mcp.json

# Plugins
/plugin install pr-review
```

---

<p align="center">
  <a href="README.md">返回首页</a>
</p>
