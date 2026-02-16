# Architecture

This document details the internal structure and design philosophy of this WezTerm configuration. The project is built to provide a modular, Neovim-inspired workflow with strong separation of concerns, cross-platform support, and maintainable code over the long term.

---

## Design Principles

### 1. Modular Composition

The configuration is split into focused modules instead of a monolithic `wezterm.lua`. Each module has a well-defined responsibility.

**Benefits:**

* Easier reasoning and debugging
* Cleaner version control diffs
* Scalable feature development
* Reduced coupling between components

---

### 2. Separation of Concerns

The project is organized into logical layers:

* **Entry layer** – bootstrapper
* **Configuration layer** – terminal behavior and composition
* **Utility layer** – reusable helper functions
* **Event layer** – UI-driven behavior
* **Asset layer** – backgrounds and visual resources
* **Tooling layer** – formatting, linting, and IDE configuration

Each layer has a clearly defined purpose and avoids leaking responsibilities.

---

## High-Level Structure

```
wezterm.lua
config/
utils/
events/
colors/
backdrops/
```

---

## Entry Point

### `wezterm.lua`

The root file acts as a minimal bootstrapper.

**Responsibilities:**

* Load the main configuration (`config/init.lua`)
* Return the composed configuration table

Business logic does not reside here; all behavior lives in `config/`, `utils/`, or `events/`.

---

## Configuration Layer `config/`

This layer defines terminal behavior and composes the final configuration.

```
config/
├── appearance.lua
├── bindings.lua
├── fonts.lua
├── general.lua
├── init.lua
└── launch.lua
```

---

### `init.lua`

The central composition module.

**Responsibilities:**

* Require all configuration modules
* Merge them into a single configuration table
* Export the final configuration

Acts as the wiring layer connecting all modules.

---

### `general.lua`

Defines base terminal options:

* Scrollback configuration
* Rendering settings
* Performance flags
* Core WezTerm options

UI and keybinding logic are not included.

---

### `appearance.lua`

Manages visual presentation:

* Window styling and padding
* Transparency and decorations
* Theme selection

Visual logic is isolated from interaction behavior.

---

### `fonts.lua`

Handles font configuration:

* Primary and fallback fonts
* Font rules and scaling

Separation allows safe font experimentation.

---

### `bindings.lua`

Encapsulates workflow ergonomics:

* Keyboard bindings
* Leader key and modal tables
* Mouse bindings
* Smart pane navigation (Neovim-style)

All navigation and workflow logic is consolidated here.

---

### `launch.lua`

Manages startup behavior:

* Domains and workspace logic
* WSL integration
* Tab and session initialization

Launch configuration is kept separate from interaction logic.

---

## Utility Layer `utils/`

Provides pure Lua helpers.

```
utils/
├── backdrops.lua
├── gpu_adapter.lua
├── math.lua
└── platform.lua
```

**Characteristics:**

* Stateless where possible
* Independent from UI concerns
* Reusable across modules

---

### `platform.lua`

Detects OS and platform-specific behavior.

* Maps modifiers correctly
* Adjusts domain logic
* Ensures cross-platform consistency

---

### `backdrops.lua`

Manages background images:

* Random selection
* Forward/backward cycling
* Fuzzy selection
* Image indexing

Keeps asset logic separate from keybindings.

---

### `gpu_adapter.lua`

Handles GPU selection and performance configuration.

Improves portability and system-specific performance tuning.

---

### `math.lua`

Provides reusable numeric helpers.

Keeps calculation logic outside configuration modules.

---

## Event Layer `events/`

Contains UI-driven logic.

```
events/
├── left-status.lua
├── new-tab-button.lua
├── right-status.lua
└── tab-title.lua
```

**Responsibilities:**

* Statusline rendering
* Tab title formatting
* Dynamic UI behavior
* Tab button logic

Dynamic UI is isolated from static configuration.

---

## Colors Layer `colors/`

```
colors/
└── custom.lua
```

Defines color schemes. Allows multiple themes without touching `appearance.lua`.

---

## Asset Layer `backdrops/`

Stores background images. Dynamically read by `utils/backdrops.lua`.

**Advantages:**

* No hardcoded paths
* Isolated visual assets
* Easily extensible

---

## Documentation Layer

### `KEYBINDINGS.md`

Reference for:

* Key mappings
* Leader modes
* Pane navigation
* Background controls
* Mouse bindings

Separates runtime configuration from user-facing documentation.

---

### `README.md`

Provides:

* Project overview
* Installation instructions
* Feature summary

---

## Tooling Layer

| File           | Purpose                           |
| -------------- | --------------------------------- |
| `.stylua.toml` | Code formatting configuration     |
| `.luacheckrc`  | Static analysis rules             |
| `.luarc.json`  | Lua language server configuration |

Ensures consistent formatting, linting, and IDE intelligence, and supports CI pipelines.

---

## Workflow Philosophy

* Neovim-inspired modal leader system
* Smart directional navigation with tab fallback
* Declarative, modular configuration loading
* Strict separation between logic and presentation

**Key traits:**

* Default WezTerm bindings disabled
* Leader-driven modes for font, pane, and swap actions
* Integrated background management
* Cross-platform modifier abstraction

---

## Configuration Flow

```
wezterm.lua
   ↓
config/init.lua
   ↓
general + appearance + fonts + bindings + launch
   ↓
utils + events
   ↓
Final configuration table returned
```

Predictable and readable execution path.

---

## Extensibility Model

To add new features:

1. Add reusable logic in `utils/` if needed
1. Add UI behavior in `events/` if applicable
1. Add keybindings in `config/bindings.lua`
1. Wire new configuration inside `config/init.lua`

Avoid placing logic inside `wezterm.lua`.

---

## Summary

This architecture provides:

* Clear module boundaries
* Cross-platform support
* Scalable feature growth
* Event-driven UI customization
* Neovim-style ergonomics
* Lint-ready, maintainable code

The project is structured for long-term evolution rather than short-term experimentation.
