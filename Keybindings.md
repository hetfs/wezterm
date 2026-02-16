# WezTerm Key Bindings Neovim-Native Workflow

This document covers **every key and mouse binding** defined in your `bindings.lua` configuration, including smart navigation and all leader key tables.

---

## Modifier Model

| Name     | macOS Mapping | Windows/Linux Mapping |            |               |
| -------- | ------------- | --------------------- | ---------- | ------------- |
| `SUPER`  | ⌘ Command     | Alt                   |            |               |
| `SUPER   | CTRL`         | ⌘ + Ctrl              | Alt + Ctrl |               |
| `LEADER` | `SUPER        | CTRL + Space`         | `SUPER     | CTRL + Space` |

> `LEADER` is defined as `Space` with `SUPER|CTRL`.

---

## Miscellaneous

| Key         | Action                        |
| ----------- | ----------------------------- |
| `F1`        | Activate Copy Mode            |
| `F2`        | Open Command Palette          |
| `F3`        | Show Launcher                 |
| `F4`        | Launcher Fuzzy + Tabs       |
| `F5`        | Launcher Fuzzy + Workspaces |
| `F11`       | Toggle Fullscreen             |
| `F12`       | Show Debug Overlay            |
| `SUPER + f` | Search (case-insensitive)     |

---

## URL Quick Select

| Key         | Action                                                    |
| ----------- | --------------------------------------------------------- |
| `SUPER + u` | Quick-select URL under cursor and open in default browser |

Supports common wrapped URL formats: `()`, `[]`, `{}`, `<>`, and raw links.

---

## Cursor Movement (Shell Navigation Enhancements)

| Key                  | Action                      |
| -------------------- | --------------------------- |
| `SUPER + LeftArrow`  | Jump to line start          |
| `SUPER + RightArrow` | Jump to line end            |
| `SUPER + Backspace`  | Delete to beginning of line |

These send terminal escape sequences for improved CLI ergonomics.

---

## Clipboard

| Key                | Action                      |
| ------------------ | --------------------------- |
| `CTRL + SHIFT + c` | Copy to system clipboard    |
| `CTRL + SHIFT + v` | Paste from system clipboard |

---

## Tab Management

| Key         | Action                       |                                     |
| ----------- | ---------------------------- | ----------------------------------- |
| `SUPER + t` | Open new tab (DefaultDomain) |                                     |
| `SUPER      | CTRL + t`                    | Open new tab (WSL:Ubuntu domain)    |
| `SUPER      | CTRL + w`                    | Close current tab (no confirmation) |
| `SUPER + [` | Activate previous tab        |                                     |
| `SUPER + ]` | Activate next tab            |                                     |
| `SUPER      | CTRL + [`                    | Move tab left                       |
| `SUPER      | CTRL + ]`                    | Move tab right                      |

---

## Window Management

| Key         | Action           |
| ----------- | ---------------- |
| `SUPER + n` | Spawn new window |

---

## Background Controls

| Key         | Action                    |                         |
| ----------- | ------------------------- | ----------------------- |
| `SUPER + /` | Set random background     |                         |
| `SUPER + ,` | Cycle background backward |                         |
| `SUPER + .` | Cycle background forward  |                         |
| `SUPER      | CTRL + /`                 | Fuzzy-select background |

The fuzzy selector opens an interactive list from `backdrops:choices()`.

---

## Pane Management

| Key             | Action                               |                    |
| --------------- | ------------------------------------ | ------------------ |
| `SUPER + \`     | Split vertically                     |                    |
| `SUPER          | CTRL + `                             | Split horizontally |
| `SUPER + Enter` | Toggle pane zoom                     |                    |
| `SUPER + w`     | Close current pane (no confirmation) |                    |

---

## Smart Pane Navigation — Neovim Style

These use `SUPER|CTRL`.

| Key | Action                               |
| --- | ------------------------------------ |
| `h` | Move left fallback to previous tab |
| `l` | Move right fallback to next tab    |
| `k` | Move up                              |
| `j` | Move down                            |

If horizontal movement fails, it switches tabs automatically.

---

## Leader Key Tables

Leader is:
`SUPER|CTRL + Space`

---

### Leader + f → Font Resize Mode

| Key      | Action             |
| -------- | ------------------ |
| `k`      | Increase font size |
| `j`      | Decrease font size |
| `r`      | Reset font size    |
| `Escape` | Exit mode          |
| `q`      | Exit mode          |

---

### Leader + p → Pane Resize Mode

| Key      | Action       |
| -------- | ------------ |
| `k`      | Resize up    |
| `j`      | Resize down  |
| `h`      | Resize left  |
| `l`      | Resize right |
| `Escape` | Exit mode    |
| `q`      | Exit mode    |

Each key press adjusts by 1 cell.

---

### Leader + s → Pane Swap Mode

Swap active pane with numbered target while keeping focus.

| Key      | Action              |
| -------- | ------------------- |
| `1–0`    | Swap with pane 1–10 |
| `Escape` | Exit mode           |
| `q`      | Exit mode           |

---

## Mouse Binding

| Input               | Action                    |
| ------------------- | ------------------------- |
| `CTRL + Left Click` | Open link at mouse cursor |

---

## Configuration Characteristics

* Default WezTerm keybindings are disabled.
* Leader-based modal system mirrors Neovim workflows.
* Horizontal smart navigation falls back to tab switching.
* Background management integrates with your custom `backdrops` module.
* WSL tab spawning is directly mapped for Windows environments.
