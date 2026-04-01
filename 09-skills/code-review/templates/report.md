# 代码审查报告模板

## 概述

| 项目 | 值 |
|------|-----|
| 文件名 | {filename} |
| 审查时间 | {timestamp} |
| 审查者 | AI Code Reviewer |
| 总问题数 | {total_issues} |

---

## 问题汇总

### 按严重程度

| 级别 | 数量 | 描述 |
|------|------|------|
| 🔴 高危 | {high_count} | 必须立即修复 |
| 🟡 中危 | {medium_count} | 应该尽快修复 |
| 🟢 低危 | {low_count} | 建议修复 |

### 按类别

| 类别 | 数量 |
|------|------|
| 安全问题 | {security_count} |
| 性能问题 | {performance_count} |
| 代码质量 | {quality_count} |
| 最佳实践 | {practice_count} |

---

## 详细问题

### 🔴 高危问题

#### 问题 1: {issue_title}

- **位置**: `{file}:{line}`
- **类别**: {category}
- **描述**: {description}
- **建议**: {suggestion}
- **示例**:
  ```{language}
  // 当前代码
  {current_code}
  
  // 建议修改
  {suggested_code}
  ```

---

### 🟡 中危问题

#### 问题 1: {issue_title}

- **位置**: `{file}:{line}`
- **类别**: {category}
- **描述**: {description}
- **建议**: {suggestion}

---

### 🟢 低危问题

#### 问题 1: {issue_title}

- **位置**: `{file}:{line}`
- **类别**: {category}
- **描述**: {description}
- **建议**: {suggestion}

---

## 代码质量评分

| 维度 | 评分 | 说明 |
|------|------|------|
| 可读性 | {readability_score}/10 | {readability_comment} |
| 可维护性 | {maintainability_score}/10 | {maintainability_comment} |
| 安全性 | {security_score}/10 | {security_comment} |
| 性能 | {performance_score}/10 | {performance_comment} |
| **总分** | **{total_score}/40** | {overall_comment} |

---

## 改进建议

### 短期（立即处理）

1. {short_term_suggestion_1}
2. {short_term_suggestion_2}

### 中期（本周处理）

1. {medium_term_suggestion_1}
2. {medium_term_suggestion_2}

### 长期（持续改进）

1. {long_term_suggestion_1}
2. {long_term_suggestion_2}

---

## 参考资源

- [安全最佳实践](https://owasp.org/)
- [代码质量指南](https://google.github.io/eng-practices/review/)
- [性能优化建议](https://web.dev/performance/)

---

*报告由 Cursor AI Code Reviewer 自动生成*
