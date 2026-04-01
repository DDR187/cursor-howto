# 06. MCP 集成

> **级别：** 中级+ | **时间：** 1 小时 | **前置条件：** 已安装 Cursor

---

## 目录

- [概述](#概述)
- [什么是 MCP](#什么是-mcp)
- [工作机制](#工作机制)
- [配置 MCP](#配置-mcp)
- [常用 MCP 服务器](#常用-mcp-服务器)
- [实战示例](#实战示例)
- [最佳实践](#最佳实践)
- [故障排查](#故障排查)

---

## 概述

MCP (Model Context Protocol) 是一个开放标准协议，让 Cursor 能够：

- 连接外部数据源
- 调用外部工具
- 访问实时信息
- 扩展 AI 能力

```mermaid
flowchart TB
    A[Cursor] --> B[MCP 协议]
    B --> C[GitHub]
    B --> D[数据库]
    B --> E[文件系统]
    B --> F[API 服务]
    B --> G[自定义工具]
    
    C --> H[PR/Issue 管理]
    D --> I[数据查询]
    E --> J[文件操作]
    F --> K[API 调用]
    G --> L[扩展功能]
```

---

## 什么是 MCP

### 定义

MCP (Model Context Protocol) 是由 Anthropic 推出的开放标准协议，用于连接 AI 模型与外部工具和数据源。

### 核心概念

```mermaid
flowchart LR
    subgraph Host["MCP Host (Cursor)"]
        H[AI 助手]
    end
    
    subgraph Protocol["MCP 协议"]
        P[标准化通信]
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

### MCP 能做什么

| 能力 | 描述 | 示例 |
|------|------|------|
| **资源访问** | 读取外部数据 | 读取数据库、文件 |
| **工具调用** | 执行操作 | 创建 PR、发送消息 |
| **提示词** | 提供模板 | 代码审查模板 |

---

## 工作机制

### MCP 架构

```mermaid
sequenceDiagram
    participant U as 用户
    participant C as Cursor
    participant MCP as MCP 协议
    participant S as MCP Server
    participant E as 外部服务
    
    U->>C: 请求需要外部数据
    C->>MCP: 查询可用工具
    MCP->>S: 列出工具
    S->>MCP: 返回工具列表
    MCP->>C: 可用工具
    
    C->>MCP: 调用工具
    MCP->>S: 执行请求
    S->>E: API 调用
    E->>S: 返回数据
    S->>MCP: 返回结果
    MCP->>C: 提供数据
    C->>U: 完成
```

### 工具发现

1. Cursor 启动时扫描配置的 MCP 服务器
2. 每个服务器报告其提供的工具
3. AI 可以在需要时调用这些工具

---

## 配置 MCP

### 配置文件位置

```
项目根目录/
├── .cursor/
│   └── mcp.json        # 项目级 MCP 配置
└── ...

用户目录/
└── .cursor/
    └── mcp.json        # 全局 MCP 配置
```

### 配置格式

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

### 添加 MCP 服务器

#### 方法一：命令行

```bash
# GitHub MCP
claude mcp add github -- npx -y @modelcontextprotocol/server-github

# PostgreSQL MCP
claude mcp add postgres -- npx -y @modelcontextprotocol/server-postgres
```

#### 方法二：手动配置

编辑 `.cursor/mcp.json` 文件。

---

## 常用 MCP 服务器

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

**功能：**
- 搜索仓库
- 创建/更新 Issue
- 创建/更新 PR
- 读取文件内容

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

**功能：**
- 执行 SQL 查询
- 查看表结构
- 数据分析

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

**功能：**
- 读写文件
- 创建目录
- 搜索文件

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

**功能：**
- 发送消息
- 读取频道消息
- 搜索消息

---

## 实战示例

### 示例 1：GitHub PR 管理

```
用户: 查看我的仓库中所有未合并的 PR

AI (使用 GitHub MCP):
正在查询 GitHub...

找到 3 个未合并的 PR：

1. #123 - 添加用户认证功能
   作者: @user1
   创建时间: 2024-01-15
   状态: 等待审查

2. #124 - 修复登录 Bug
   作者: @user2
   创建时间: 2024-01-14
   状态: 有冲突

3. #125 - 更新文档
   作者: @user3
   创建时间: 2024-01-13
   状态: 需要修改
```

### 示例 2：数据库查询

```
用户: 查询过去一周注册的用户数量

AI (使用 PostgreSQL MCP):
正在查询数据库...

查询结果：
- 过去 7 天注册用户: 1,234
- 日均注册: 176
- 峰值日: 2024-01-18 (245 用户)

详细数据：
| 日期       | 注册数 |
|------------|--------|
| 2024-01-19 | 189    |
| 2024-01-18 | 245    |
| 2024-01-17 | 167    |
| ...        | ...    |
```

### 示例 3：自动化工作流

```
用户: 为这个 Issue 创建一个 PR

AI (使用 GitHub MCP):
1. 读取 Issue #126 内容
2. 分析需要的修改
3. 创建新分支
4. 生成代码修改
5. 创建 PR

PR #127 已创建：
标题: 修复用户头像上传问题
链接: https://github.com/xxx/pull/127
```

---

## 最佳实践

### ✅ 应该做的

1. **使用环境变量** - 不要硬编码敏感信息
2. **限制权限** - 只授予必要的权限
3. **测试连接** - 配置后测试 MCP 是否工作
4. **文档化** - 记录项目使用的 MCP 服务器
5. **版本控制** - 将配置纳入 Git（排除敏感信息）

### ❌ 不应该做的

1. **硬编码 Token** - 使用环境变量
2. **过度权限** - 只授予必要的权限
3. **忽略错误** - 检查 MCP 连接状态
4. **提交敏感信息** - 使用 .gitignore 排除

### 安全配置

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
# 设置环境变量
export GITHUB_TOKEN="your_token_here"

# 或在 .env 文件中
GITHUB_TOKEN=your_token_here
```

---

## 故障排查

### MCP 连接失败

**症状：** AI 无法使用 MCP 工具

**解决方案：**
1. 检查 MCP 服务器是否正确安装
2. 验证环境变量是否设置
3. 检查网络连接
4. 查看 Cursor 日志

### 权限错误

**症状：** MCP 工具返回权限错误

**解决方案：**
1. 检查 Token 是否有效
2. 验证 Token 权限范围
3. 重新生成 Token

### 性能问题

**症状：** MCP 调用很慢

**解决方案：**
1. 减少不必要的 MCP 服务器
2. 优化查询语句
3. 检查网络延迟

---

## 下一步

- [07. 高级功能](../07-advanced-features/) - 探索高级功能
- [08. 最佳实践](../08-best-practices/) - 学习工作流
- [09. Skills](../09-skills/) - 创建自定义技能

---

<p align="center">
  <a href="../README.md">返回首页</a> | <a href="github-mcp.json">GitHub MCP 配置</a> | <a href="database-mcp.json">数据库 MCP 配置</a>
</p>
