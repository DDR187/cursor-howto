# PR Review Plugin

> 完整的 PR 代码审查解决方案

## 功能

- ✅ 自动代码审查
- ✅ 安全漏洞检测
- ✅ 测试覆盖率检查
- ✅ 文档完整性检查
- ✅ GitHub 集成

## 安装

```bash
# 方法 1: 从市场安装
/plugin install pr-review

# 方法 2: 手动安装
git clone https://github.com/cursor-community/pr-review-plugin.git
cp -r pr-review-plugin ~/.cursor/plugins/pr-review
```

## 使用

### 审查当前 PR

```
/pr-review
```

### 审查特定文件

```
/pr-review src/utils/auth.ts
```

## 配置

在 `.cursor/settings.json` 中配置：

```json
{
  "prReview": {
    "severity": {
      "security": "high",
      "quality": "medium",
      "style": "low"
    },
    "autoComment": true,
    "checkTests": true,
    "checkDocs": true
  }
}
```

## 包含内容

| 类型 | 文件 | 描述 |
|------|------|------|
| Rules | `rules/review.mdc` | 审查规则 |
| Skills | `skills/review/SKILL.md` | 审查技能 |
| Agents | `agents/reviewer.md` | 审查 Agent |
| Hooks | `hooks/pre-commit.sh` | 提交前检查 |
| MCP | `mcp/github.json` | GitHub 集成 |

## 输出示例

```markdown
# PR 审查报告

## 概述
- PR: #123
- 作者: @developer
- 文件数: 5
- 问题数: 3

## 问题列表

### 🔴 高危 (1)

| 文件 | 行号 | 问题 |
|------|------|------|
| auth.ts | 45 | 硬编码密钥 |

### 🟡 中危 (1)

| 文件 | 行号 | 问题 |
|------|------|------|
| user.ts | 23 | 缺少输入验证 |

### 🟢 低危 (1)

| 文件 | 行号 | 问题 |
|------|------|------|
| utils.ts | 12 | 缺少注释 |

## 建议

1. 将密钥移至环境变量
2. 添加输入验证中间件
3. 为工具函数添加文档
```

## 许可证

MIT
