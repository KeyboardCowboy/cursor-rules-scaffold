# Cursor Rules Scaffold

A template repository for managing Cursor rules across different levels of scope: global, project, and personal. This scaffold provides a structured approach to organizing and maintaining Cursor rules for consistent development practices.

> This project is based on the structure from [tacticlaunch/cursor-bank](https://github.com/tacticlaunch/cursor-bank), adapted to focus specifically on Cursor rules management.

## Purpose

This scaffold is designed to help teams and individuals:
- Maintain consistent coding standards and practices
- Share project-specific rules across team members
- Allow personal rule customization without affecting others
- Document and version control rule changes
- Provide a template for new projects

## Structure

```
.
├── .cursor/
│   └── rules/
│       ├── personal/     # Personal rules (git-ignored)
│       ├── global/       # Project-level global rules
│       └── core.mdc      # Core project rules
├── memory-bank/         # Documentation and templates (git-ignored)
│   ├── docs/           # Rule documentation
│   ├── examples/       # Example rules
│   └── templates/      # Rule templates
└── project-plan.md     # Project documentation
```

## Rule Levels

1. **Global Rules** (System-wide)
   - Located in system-wide Cursor configuration
   - Apply to all projects
   - Managed by system administrators

2. **Project Rules** (`.cursor/rules/`)
   - Stored in the project repository
   - Shared across all team members
   - Version controlled
   - Includes both global and core project rules

3. **Personal Rules** (`.cursor/rules/personal/`)
   - Stored locally
   - Not shared or version controlled
   - Allows individual customization
   - Directory structure is preserved in git

## Getting Started

1. Clone this repository as a template for your project
2. Review the rules in `.cursor/rules/`
3. Create your personal rules in `.cursor/rules/personal/`
4. Customize project rules as needed

## Documentation

- `memory-bank/docs/cursor-rules.md`: Detailed explanation of the rules system
- `memory-bank/docs/rule-creation.md`: Guide for creating new rules
- `memory-bank/examples/`: Example rules for reference
- `memory-bank/templates/`: Templates for creating new rules

## Notes

- The `memory-bank` directory is excluded from git to keep documentation and templates local
- Personal rules (`.mdc` files) are git-ignored but the directory structure is preserved
- Project rules are version controlled and shared with the team 