---
name: Documentation Generator
description: 自动生成 API 文档和代码文档
triggers:
  - type: command
    command: "/docs"
  - type: command
    command: "/generate-docs"
---

# Documentation Generator Skill

## 功能概述

自动分析代码并生成文档：

- API 接口文档
- 函数/方法文档
- 类型定义文档
- 使用示例

---

## 文档类型

### 1. API 文档

从 API 路由自动生成：

- 端点描述
- 请求参数
- 响应格式
- 错误码

### 2. 函数文档

从代码注释生成：

- 函数描述
- 参数说明
- 返回值说明
- 使用示例

### 3. 类型文档

从 TypeScript 类型生成：

- 接口定义
- 类型说明
- 属性描述

---

## 输出格式

```markdown
# API 文档

## {endpoint_name}

**端点**: `{method} {path}`

### 描述
{description}

### 请求参数

| 参数 | 类型 | 必需 | 描述 |
|------|------|------|------|
| {param} | {type} | {required} | {description} |

### 请求示例

```json
{
  "{param}": "{value}"
}
```

### 响应格式

| 字段 | 类型 | 描述 |
|------|------|------|
| {field} | {type} | {description} |

### 响应示例

```json
{
  "{field}": "{value}"
}
```

### 错误码

| 状态码 | 描述 |
|--------|------|
| {code} | {description} |
```

---

## 使用示例

```
用户: /docs src/api/users.ts

AI: 正在生成 API 文档...

# Users API 文档

## 获取用户列表

**端点**: `GET /api/users`

### 描述
获取所有用户的列表，支持分页和过滤。

### 请求参数

| 参数 | 类型 | 必需 | 描述 |
|------|------|------|------|
| page | number | 否 | 页码，默认 1 |
| limit | number | 否 | 每页数量，默认 10 |
| search | string | 否 | 搜索关键词 |

### 响应格式

| 字段 | 类型 | 描述 |
|------|------|------|
| data | User[] | 用户列表 |
| total | number | 总数量 |
| page | number | 当前页码 |

...
```
