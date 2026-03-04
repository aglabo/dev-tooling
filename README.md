# @aglabo/dev-tooling

Shared development tooling for the aglabo ecosystem.

This repository provides:

- Shared configuration for development tools
- Thin runner scripts to execute tools consistently
- A unified CLI entry point (via npm `bin`)

## Scope

This repository contains:

### Tool Configurations

- textlint
- markdownlint
- secretlint
- gitleaks
- actionlint
- ghalint
- ls-lint
- dprint

### Runners

Thin wrapper scripts that:

- Collect target files
- Execute the corresponding tool
- Do not perform installation or environment setup

## Design Principles

- No project-specific logic
- No build step
- No runtime state
- Deterministic execution
- OS-agnostic (Windows + bash compatible)

## Directory Structure

```bash
dev-tooling/
├ configs/
├ runners/
├ bin/
└ package.json
```

## Installation (Node-based projects)

```bash
pnpm add -D @aglabo/dev-tooling
```

Then:

```bash
pnpm exec aglabo-actionlint
```

## Usage Without Node

You may also use this repository via:

- git submodule
- direct file reference
- copying configs into your project

## Relation to Other aglabo Repositories

| Repository         | Responsibility                   |
| ------------------ | -------------------------------- |
| `.github`          | Policy & repository conventions  |
| `dev-tooling`      | Tool configuration & runners     |
| `ci-platform`      | CI orchestration & reusable jobs |
| `starter-template` | Project scaffolding              |

---

MIT License
