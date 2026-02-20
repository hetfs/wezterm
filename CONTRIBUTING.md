# Contributing Guide

Thank you for considering contributing to this WezTerm configuration project.
This repository is designed to be modular, readable, and maintainable. Please follow the guidelines below to ensure contributions remain consistent and high quality.

---

## Code of Conduct

Be respectful and constructive in all interactions:

* Assume good intent.
* Provide clear reasoning for proposed changes.
* Avoid unnecessary complexity.
* Keep discussions focused on improving the project.

---

## Development Principles

Before contributing, familiarize yourself with the architectural goals:

* Modular structure.
* Clear separation of concerns.
* Cross-platform compatibility.
* Neovim-inspired workflow.
* No monolithic configuration logic.

Refer to [ARCHITECTURE](./docs/architecture.md) for detailed guidance.

---

## Project Structure

```
wezterm.lua
config/
utils/
events/
colors/
backdrops/
```

### Responsibilities

* `config/` → Terminal configuration modules.
* `utils/` → Pure Lua helper modules.
* `events/` → UI event handlers.
* `colors/` → Theme definitions.
* `backdrops/` → Background assets.

⚠️ **Do not** place business logic inside `wezterm.lua`.

---

## Getting Started

### 1. Fork the Repository

Create your own fork and clone it locally:

```bash
git clone https://github.com/<your-username>/wezterm.git
cd wezterm
```

---

### 2. Create a Feature Branch

Use descriptive branch names:

```bash
git checkout -b feature/smart-workspace-presets
```

---

## Coding Standards

This project relies on:

* **Stylua** for formatting.
* **Luacheck** for linting.
* **Lua Language Server** for IDE support.

### Format Code

```bash
.stylua
```

### Lint Code

```bash
.luacheck
```

All pull requests must pass formatting and linting checks.

---

## Contribution Types

### 1. Feature Enhancements

Examples:

* New leader mode.
* Additional smart navigation logic.
* Workspace presets.
* Theme additions.
* Statusline improvements.

Keep features modular and isolated.

---

### 2. Performance Improvements

* Optimize rendering configuration.
* Improve backdrop cycling efficiency.
* Reduce unnecessary state.

Provide benchmarks or reasoning where applicable.

---

### 3. Documentation Improvements

* Improve README clarity.
* Expand ARCHITECTURE documentation.
* Update KEYBINDINGS.md.
* Add usage examples.

Clear documentation is highly valued.

---

### 4. Bug Fixes

When addressing a bug:

* Explain the root cause.
* Describe the solution.
* Include reproduction steps if possible.

---

## Design Rules

Follow these architectural guidelines:

* Avoid large logic blocks inside `wezterm.lua`.
* Utilities must remain reusable and isolated.
* Event logic must stay inside `events/`.
* Keybindings must remain in `config/bindings.lua`.
* Preserve cross-platform modifier behavior.

If uncertain, open an issue first.

---

## Commit Message Guidelines

Use clear, structured commit messages:

```
type(scope): short description

optional longer explanation
```

**Examples:**

```
feat(bindings): add workspace preset leader mode
fix(backdrops): prevent index overflow on cycle
docs(readme): improve installation instructions
```

**Common types:**

* `feat` → new feature
* `fix` → bug fix
* `refactor` → code restructure
* `docs` → documentation update
* `chore` → maintenance
* `perf` → performance improvements

---

## Pull Request Checklist

Before submitting a PR:

* [ ] Code formatted with Stylua.
* [ ] No Luacheck warnings.
* [ ] Tested on at least one platform.
* [ ] Architecture principles respected.
* [ ] Documentation updated if needed.

---

## Testing Guidelines

Because this is a runtime configuration:

* Test pane navigation.
* Test tab movement.
* Test leader modes.
* Test background cycling.
* Test on at least one OS.

Cross-platform testing is encouraged.

---

## Proposing Major Changes

For significant modifications:

1. Open an issue first.
1. Describe the proposal.
1. Explain the motivation.
1. Outline architectural impact.

This helps prevent unnecessary rework.

---

## Feature Roadmap Suggestions

Ideas are welcome, such as:

* Theme presets.
* Workspace templates.
* Feature flags.
* Remote development presets.
* Enhanced statusline metrics.

---

## Reporting Issues

Include the following when opening an issue:

* Operating system.
* WezTerm version.
* Reproduction steps.
* Expected behavior.
* Actual behavior.

Official WezTerm documentation: [wezfurlong.org](https://wezfurlong.org/wezterm/)

---

## License

By contributing, you agree that all contributions will be licensed under the MIT License.

---

## Final Notes

This project values:

* Clean architecture.
* Intentional key design.
* Cross-platform reliability.
* Long-term maintainability.

Thoughtful, modular contributions are always appreciated.
