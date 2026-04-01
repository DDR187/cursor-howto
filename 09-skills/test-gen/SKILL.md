---
name: Test Generator
description: 自动生成单元测试和集成测试
triggers:
  - type: file_create
    glob: "src/**/*.ts"
  - type: command
    command: "/test"
---

# Test Generator Skill

## 功能概述

自动分析代码并生成测试：

- 单元测试
- 集成测试
- E2E 测试
- 测试覆盖率报告

---

## 测试框架

| 语言 | 框架 |
|------|------|
| TypeScript/JavaScript | Vitest / Jest |
| Python | Pytest |
| Go | Go Testing |

---

## 测试模板

### 单元测试

```typescript
import { describe, it, expect, beforeEach } from 'vitest';
import { {functionName} } from '../{filename}';

describe('{functionName}', () => {
  describe('正常情况', () => {
    it('应该正确处理有效输入', () => {
      // Arrange
      const input = {valid_input};
      const expected = {expected_output};
      
      // Act
      const result = {functionName}(input);
      
      // Assert
      expect(result).toEqual(expected);
    });
  });
  
  describe('边界情况', () => {
    it('应该处理空输入', () => {
      // Arrange
      const input = null;
      
      // Act & Assert
      expect(() => {functionName}(input)).toThrow();
    });
  });
  
  describe('错误情况', () => {
    it('应该处理无效输入', () => {
      // Arrange
      const input = {invalid_input};
      
      // Act & Assert
      expect(() => {functionName}(input)).toThrow('{error_message}');
    });
  });
});
```

---

## 使用示例

```
用户: /test src/utils/validation.ts

AI: 正在生成测试文件...

已创建: src/utils/__tests__/validation.test.ts

测试覆盖:
- validateEmail(): 3 个测试用例
- validatePhone(): 3 个测试用例
- validatePassword(): 4 个测试用例

运行测试: npm test src/utils/__tests__/validation.test.ts
```
