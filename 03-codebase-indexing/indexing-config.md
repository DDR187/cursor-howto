# 代码库索引配置参考

## 索引设置

### 基本配置

```json
// .cursor/settings.json
{
  "cursor.codebaseIndexing": {
    "enabled": true,
    "indexOnOpen": true,
    "indexOnSave": true,
    "maxFileSize": 1048576,
    "maxFiles": 10000
  }
}
```

### 包含/排除规则

```json
{
  "cursor.codebaseIndexing": {
    "include": [
      "src/**/*",
      "lib/**/*",
      "components/**/*"
    ],
    "exclude": [
      "node_modules/**",
      "dist/**",
      "build/**",
      ".next/**",
      "coverage/**",
      "*.min.js",
      "*.min.css",
      "package-lock.json",
      "yarn.lock"
    ]
  }
}
```

---

## .cursorignore 配置

创建 `.cursorignore` 文件排除不需要索引的文件：

```gitignore
# 依赖
node_modules/
vendor/
venv/

# 构建输出
dist/
build/
.next/
out/

# 测试
coverage/
.nyc_output/

# 日志
*.log
logs/

# 缓存
.cache/
.parcel-cache/

# 锁文件
package-lock.json
yarn.lock
pnpm-lock.yaml

# 压缩文件
*.min.js
*.min.css

# 大文件
*.pdf
*.zip
*.tar.gz

# 环境文件
.env
.env.local
.env.*.local

# IDE
.idea/
.vscode/
*.swp
*.swo

# 系统文件
.DS_Store
Thumbs.db
```

---

## 索引优化

### 大型项目优化

```json
{
  "cursor.codebaseIndexing": {
    "enabled": true,
    "strategy": "incremental",
    "batchSize": 100,
    "throttleMs": 100
  }
}
```

### 内存优化

```json
{
  "cursor.codebaseIndexing": {
    "maxMemoryMB": 512,
    "gcInterval": 60000
  }
}
```

### 网络优化

```json
{
  "cursor.codebaseIndexing": {
    "embeddingBatchSize": 50,
    "retryAttempts": 3,
    "timeoutMs": 30000
  }
}
```

---

## 索引状态检查

### 命令面板

```
Cmd+Shift+P → "Cursor: Show Indexing Status"
```

### 状态信息

| 状态 | 描述 |
|------|------|
| `indexing` | 正在索引 |
| `ready` | 索引完成 |
| `error` | 索引错误 |
| `disabled` | 索引禁用 |

---

## 故障排查

### 索引不完整

```bash
# 清除索引缓存
rm -rf ~/.cursor/index/

# 重新索引
Cmd+Shift+P → "Cursor: Reindex Codebase"
```

### 索引占用过多资源

```json
{
  "cursor.codebaseIndexing": {
    "enabled": true,
    "throttleCpu": true,
    "maxCpuPercent": 50
  }
}
```

### 索引结果不准确

1. 检查 `.cursorignore` 配置
2. 确保包含规则正确
3. 重新索引项目

---

## 最佳实践

### ✅ 应该做的

- 排除大型依赖目录
- 排除构建产物
- 排除测试覆盖率报告
- 定期重新索引

### ❌ 不应该做的

- 索引 node_modules
- 索引压缩文件
- 索引二进制文件
- 索引大型数据文件
