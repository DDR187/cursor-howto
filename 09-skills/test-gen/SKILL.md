---
name: Test Generator
description: Automatically generate unit tests and integration tests
triggers:
  - type: file_create
    glob: "src/**/*.ts"
  - type: command
    command: "/test"
---

# Test Generator Skill

## Overview

Automatically analyze code and generate tests:

- Unit tests
- Integration tests
- E2E tests
- Test coverage reports

---

## Test Frameworks

| Language | Framework |
|----------|-----------|
| TypeScript/JavaScript | Vitest / Jest |
| Python | Pytest |
| Go | Go Testing |

---

## Test Template

### Unit Test

```typescript
import { describe, it, expect, beforeEach } from 'vitest';
import { {functionName} } from '../{filename}';

describe('{functionName}', () => {
  describe('Normal Cases', () => {
    it('should handle valid input correctly', () => {
      // Arrange
      const input = {valid_input};
      const expected = {expected_output};
      
      // Act
      const result = {functionName}(input);
      
      // Assert
      expect(result).toEqual(expected);
    });
  });
  
  describe('Edge Cases', () => {
    it('should handle empty input', () => {
      // Arrange
      const input = null;
      
      // Act & Assert
      expect(() => {functionName}(input)).toThrow();
    });
  });
  
  describe('Error Cases', () => {
    it('should handle invalid input', () => {
      // Arrange
      const input = {invalid_input};
      
      // Act & Assert
      expect(() => {functionName}(input)).toThrow('{error_message}');
    });
  });
});
```

---

## Usage Example

```
User: /test src/utils/validation.ts

AI: Generating test file...

Created: src/utils/__tests__/validation.test.ts

Test Coverage:
- validateEmail(): 3 test cases
- validatePhone(): 3 test cases
- validatePassword(): 4 test cases

Run tests: npm test src/utils/__tests__/validation.test.ts
```
