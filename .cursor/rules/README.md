# Cursor Rules Directory

This directory contains Cursor rules organized into three categories, working alongside existing core rules files.

## Directory Structure

```
.cursor/rules/
├── core.mdc           # Core Cursor behavior rules
├── memory-bank.mdc    # Memory bank documentation
├── global/            # Global rules that apply to all projects
├── project/           # Project-specific rules
└── personal/          # Personal rules (git-ignored)
```

## Rule Categories

### Core Rules (`core.mdc`)
- Fundamental Cursor behavior rules
- Required for basic operation
- Do not modify unless necessary

### Memory Bank Rules (`memory-bank.mdc`)
- Documentation of memory bank structure
- Required for project context
- Do not modify unless necessary

### Global Rules (`global/`)
- Rules that apply across all projects
- Committed to repository
- Examples:
  - Code formatting standards
  - Git commit message format
  - Documentation requirements

### Project Rules (`project/`)
- Rules specific to this project
- Committed to repository
- Examples:
  - Project-specific naming conventions
  - Framework-specific patterns
  - Team workflow requirements

### Personal Rules (`personal/`)
- Individual developer preferences
- Not committed to repository
- Examples:
  - Editor preferences
  - Personal coding style
  - Custom shortcuts

## File Format
All rules are stored in `.mdc` files (Markdown Cursor) with the following structure:

```markdown
## Rule Title

Description of the rule and its purpose.

```json
{
  "pattern": "pattern to match",
  "message": "message to display",
  "severity": "warning|error|info",
  "enabled": true
}
```

## Adding New Rules
1. Choose the appropriate directory based on the rule's scope
2. Create a new `.mdc` file with a descriptive name
3. Follow the standard markdown structure
4. Test the rule locally before sharing

## Important Notes
- Do not modify `core.mdc` or `memory-bank.mdc` unless absolutely necessary
- These files contain essential Cursor behavior rules
- New rules should be added to the appropriate category directory 