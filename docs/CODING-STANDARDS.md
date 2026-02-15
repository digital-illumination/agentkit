# Coding Standards

Follow these standards when generating or modifying code in this repository.

---

## General Rules

- **British English** spelling throughout (colour, organisation, behaviour)
- **Maximum 80 characters** per line where practical
- **Follow existing patterns** in the codebase
- **Include all necessary imports** at the top of files

---

## Data Classification & Redaction

**Never expose or hardcode these in code, logs, or outputs:**

| Data Type | Examples | Handling |
|-----------|----------|----------|
| **PII** | Email, phone, address, name | Mask in logs; do not include in error messages |
| **Credentials** | API keys, passwords, tokens | Use environment variables or secrets management |
| **Session Data** | Session IDs, auth tokens | Never log or expose |
| **Client Data** | Business records, financial data | Do not include in debug logs for production |

**Rules:**
- Never commit credentials to Git; use `.gitignore` and environment variables
- Use appropriate logging levels for sensitive data (debug only, never info/warn/error)
- In production, ensure debug logs are disabled or filtered

---

## Language-Specific Standards

[PLACEHOLDER: Replace this section with standards for your project's language(s). Below is a generic framework to guide you.]

### Naming Conventions

| Element | Convention | Example |
|---------|------------|---------|
| Files | [e.g., kebab-case, PascalCase] | [e.g., `user-service.ts`, `UserService.java`] |
| Classes/Types | [e.g., PascalCase] | [e.g., `UserService`] |
| Functions/Methods | [e.g., camelCase] | [e.g., `getUserById()`] |
| Variables | [e.g., camelCase] | [e.g., `accountList`] |
| Constants | [e.g., UPPER_SNAKE] | [e.g., `MAX_RETRY_COUNT`] |

### Import Ordering

1. Built-in / standard library
2. Third-party dependencies
3. Project-internal imports (e.g., `@/lib/`, `./utils`)

### Type Declarations

[e.g., "Always use `type` for TypeScript type aliases; never use `interface`"]

### Export Style

[e.g., "Prefer named exports over default exports"]

### Error Handling

```
// [Language-appropriate example of standard error handling pattern]
```

---

## Testing Standards

### General Patterns

- **Arrange / Act / Assert** structure for all tests
- Test both positive and negative scenarios
- Use descriptive test names that explain the expected behaviour
- Reference spec IDs in test descriptions (see `docs/TESTING-STRATEGY.md`)

### Test Naming

```
// Good: describes behaviour and references spec
it("creates items and loads them on refresh (QA-003, QA-004)", ...)

// Bad: vague description
it("works correctly", ...)
```

### Mocking

- Prefer dependency injection over module mocking where practical
- Mock at the boundary (API calls, database, file system) not at internal modules
- Keep test setup minimal and readable

---

## Component Standards

[PLACEHOLDER: If your project uses UI components, document component conventions here.]

---

## Git Commit Messages

Format: `[type]: Brief description`

Types:
- `feat:` New feature
- `fix:` Bug fix
- `refactor:` Code refactoring
- `test:` Adding/updating tests
- `docs:` Documentation changes
- `chore:` Maintenance tasks

Examples:
```
feat: Add user registration endpoint
fix: Resolve null pointer in account lookup
refactor: Extract validation logic to shared utility
docs: Update API documentation for v2 endpoints
```

---

## Common Pitfalls

| Pitfall | Problem | Solution |
|---------|---------|----------|
| **Hardcoded values** | Breaks across environments | Use environment variables or config |
| **Missing error handling** | Silent failures | Always handle errors explicitly |
| **No null checks** | Runtime exceptions | Validate inputs at boundaries |
| **Synchronous blocking** | Performance degradation | Use async patterns where appropriate |
| **Missing input validation** | Security vulnerabilities | Validate and sanitise all user input |

---

**Last Updated:** [Date]
