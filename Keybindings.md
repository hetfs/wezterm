# WezTerm Key Bindings

## Neovim-Native Workflow

This document covers **every key and mouse binding** defined in your `bindings.lua` configuration, including smart navigation, leader key tables, and dynamic collision-safe mappings.

---

# Modifier Model

| Name           | macOS Mapping        | Windows/Linux Mapping |
| -------------- | -------------------- | --------------------- |
| `SUPER`        | ⌘ Command            | Alt                   |
| `SUPER + CTRL` | ⌘ + Ctrl             | Alt + Ctrl            |
| `LEADER`       | SUPER + CTRL + Space | SUPER + CTRL + Space  |

> `LEADER` is defined as `Space` with `SUPER|CTRL`.

---

# System / Global

| Key           | Action                   |                      |                    |
| ------------- | ------------------------ | -------------------- | ------------------ |
| `F1`          | Activate Copy Mode       |                      |                    |
| `F2`          | Open Command Palette     |                      |                    |
| `F3`          | Show Launcher            |                      |                    |
| `F11`         | Toggle Fullscreen        |                      |                    |
| `F12`         | Show Debug Overlay       |                      |                    |
| `Enter + ALT` | Toggle Fullscreen        |                      |                    |
| `R + CTRL`    | Reload configuration     |                      |                    |
| `R + SHIFT    | CTRL`                    | Reload configuration |                    |
| `P + CTRL`    | Activate Command Palette |                      |                    |
| `T + CTRL`    | Show Launcher            |                      |                    |
| `T + SHIFT    | CTRL`                    | Show Launcher        |                    |
| `N + CTRL`    | Spawn new window         |                      |                    |
| `E + SUPER    | SHIFT`                   | Rename current tab   |                    |
| `E + CTRL     | SHIFT                    | ALT`                 | Toggle colorscheme |
| `o + CTRL     | SHIFT`                   | Toggle background    |                    |
| `o + CTRL     | ALT                      | SHIFT`               | Toggle opacity     |

---

# Clipboard

| Key                | Action                       |
| ------------------ | ---------------------------- |
| `CTRL + SHIFT + C` | Copy to system clipboard     |
| `CTRL + SHIFT + V` | Paste from system clipboard  |
| `V + CTRL`         | Paste from system clipboard  |
| `Insert + SHIFT`   | Paste from primary selection |
| `Insert + CTRL`    | Copy to primary selection    |

---

# Font Controls

| Key            | Action             |
| -------------- | ------------------ |
| `+ / = + CTRL` | Increase font size |
| `- + CTRL`     | Decrease font size |
| `0 + CTRL`     | Reset font size    |
| `- + SUPER`    | Decrease font size |
| `= + SUPER`    | Increase font size |
| `0 + SUPER`    | Reset font size    |
| `) + CTRL`     | Reset font size    |

---

# Tab Navigation

| Key          | Action                 |                       |
| ------------ | ---------------------- | --------------------- |
| `Tab + CTRL` | Activate next tab      |                       |
| `Tab + SHIFT | CTRL`                  | Activate previous tab |
| `[ + SUPER`  | Activate previous tab  |                       |
| `] + SUPER`  | Activate next tab      |                       |
| `{ + SUPER`  | Activate previous tab  |                       |
| `} + SUPER`  | Activate next tab      |                       |
| `1–5 + CTRL` | Activate tab 1–5       |                       |
| `! + CTRL`   | Activate tab 0         |                       |
| `@ + CTRL`   | Activate tab 1         |                       |
| `# + CTRL`   | Activate tab 2         |                       |
| `$ + CTRL`   | Activate tab 3         |                       |
| `% + CTRL`   | Activate tab 4         |                       |
| `^ + CTRL`   | Activate tab 5         |                       |
| `& + CTRL`   | Activate tab 6         |                       |
| `* + CTRL`   | Activate tab 7         |                       |
| `( + CTRL`   | Activate last tab (-1) |                       |

---

# Tab Management

| Key         | Action                                |
| ----------- | ------------------------------------- |
| `SUPER + t` | Open new tab (DefaultDomain)          |
| `w + SUPER` | Close current tab (with confirmation) |

---

# Window Management

| Key         | Action           |
| ----------- | ---------------- |
| `N + SUPER` | Spawn new window |

---

# Background Controls

| Key       | Action |                   |                |
| --------- | ------ | ----------------- | -------------- |
| `o + CTRL | SHIFT` | Toggle background |                |
| `o + CTRL | ALT    | SHIFT`            | Toggle opacity |

---

# Pane Management

| Key               | Action                            |
| ----------------- | --------------------------------- |
| `h/j/k/l + SUPER` | Activate pane in direction        |
| `Z + CTRL`        | Toggle pane zoom                  |
| `X + CTRL`        | Activate copy mode                |
| `\\ + LEADER`     | Split horizontally                |
| `- + LEADER`      | Split vertically                  |
| `c + LEADER`      | Spawn new tab (CurrentPaneDomain) |
| `q + LEADER`      | Close current pane                |
| `Enter + ALT`     | Toggle fullscreen for pane        |

---

# Smart Pane Navigation (Neovim Style)

| Key | Action                             |
| --- | ---------------------------------- |
| `h` | Move left (fallback: previous tab) |
| `l` | Move right (fallback: next tab)    |
| `k` | Move up                            |
| `j` | Move down                          |

---

# Leader Key Tables

Leader: `SUPER + CTRL + Space`

---

## Leader + Pane Movement / Resize

| Key  | Action             |
| ---- | ------------------ |
| `h`  | Move pane left     |
| `j`  | Move pane down     |
| `k`  | Move pane up       |
| `l`  | Move pane right    |
| `H`  | Resize pane left   |
| `J`  | Resize pane down   |
| `K`  | Resize pane up     |
| `L`  | Resize pane right  |
| `\\` | Split horizontal   |
| `-`  | Split vertical     |
| `c`  | Spawn new tab      |
| `q`  | Close current pane |

---

## Leader + Font Resize Mode

| Key      | Action             |
| -------- | ------------------ |
| `k`      | Increase font size |
| `j`      | Decrease font size |
| `r`      | Reset font size    |
| `Escape` | Exit mode          |
| `q`      | Exit mode          |

---

# Mouse Bindings

| Input               | Action                          |
| ------------------- | ------------------------------- |
| `CTRL + Left Click` | Open link at mouse cursor       |
| `Left Click`        | Complete selection to clipboard |
| `Triple Left Click` | Select semantic text zone       |

---

# Notes

* Default WezTerm keybindings are disabled.
* Leader-based modal system mirrors Neovim workflows.
* Horizontal pane movement falls back to tab switching.
* Background management integrates with the `backdrops` module.
* All keys are collision-safe; any duplicates will error on startup.
* SUPER / CTRL modifiers are platform-aware.
