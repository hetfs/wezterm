# WezTerm Key Bindings

*Neovim-Native Workflow*

This document reflects the current `bindings.lua` configuration.
It lists every active key and mouse binding, aligned with the collision-safe registration system and modal leader table.

---

## Modifier Model

| Name        | macOS Mapping     | Windows / Linux Mapping |
| ----------- | ----------------- | ----------------------- |
| `SUPER`     | ⌘ Command         | Alt                     |
| `SUPER_REV` | ⌘ + Ctrl          | Alt + Ctrl              |
| `LEADER`    | SUPER_REV + Space | SUPER_REV + Space       |

> `LEADER` is defined as `Space` with `SUPER_REV`.

---

## System / Global

| Key                      | Action                   |
| ------------------------ | ------------------------ |
| `F1`                     | Activate Copy Mode       |
| `F2`                     | Open Command Palette     |
| `F3`                     | Show Launcher            |
| `F11`                    | Toggle Fullscreen        |
| `F12`                    | Show Debug Overlay       |
| `ALT + Enter`            | Toggle Fullscreen        |
| `CTRL + R`               | Reload configuration     |
| `CTRL + P`               | Activate Command Palette |
| `CTRL + T`               | Show Launcher            |
| `CTRL + N`               | Spawn new window         |
| `CTRL + SHIFT + o`       | Toggle background        |
| `CTRL + ALT + SHIFT + o` | Toggle opacity           |
| `CTRL + SHIFT + ALT + E` | Toggle colorscheme       |
| `SUPER + SHIFT + E`      | Rename current tab       |

---

## Clipboard

| Key                | Action                       |
| ------------------ | ---------------------------- |
| `CTRL + SHIFT + C` | Copy to system clipboard     |
| `CTRL + SHIFT + V` | Paste from system clipboard  |
| `SHIFT + Insert`   | Paste from primary selection |
| `CTRL + Insert`    | Copy to primary selection    |

---

## Font Controls

| Key         | Action             |
| ----------- | ------------------ |
| `CTRL + =`  | Increase font size |
| `CTRL + -`  | Decrease font size |
| `CTRL + 0`  | Reset font size    |
| `SUPER + =` | Increase font size |
| `SUPER + -` | Decrease font size |
| `SUPER + 0` | Reset font size    |

---

## Tab Navigation

| Key                  | Action                |
| -------------------- | --------------------- |
| `CTRL + Tab`         | Activate next tab     |
| `CTRL + SHIFT + Tab` | Activate previous tab |
| `SUPER + [`          | Activate previous tab |
| `SUPER + ]`          | Activate next tab     |
| `SUPER_REV + [`      | Move tab left         |
| `SUPER_REV + ]`      | Move tab right        |
| `CTRL + 1–8`         | Activate tab 1–8      |

---

## Tab Management

| Key         | Action                         |
| ----------- | ------------------------------ |
| `SUPER + t` | Open new tab (`DefaultDomain`) |
| `SUPER + w` | Close current tab (confirm)    |
| `SUPER + n` | Spawn new window               |

---

## Pane Navigation (Neovim Style)

| Key         | Action             |
| ----------- | ------------------ |
| `SUPER + h` | Focus left pane    |
| `SUPER + j` | Focus down pane    |
| `SUPER + k` | Focus up pane      |
| `SUPER + l` | Focus right pane   |
| `CTRL + z`  | Toggle pane zoom   |
| `CTRL + x`  | Activate copy mode |

---

## Scroll / Prompt Navigation

| Key                        | Action                    |
| -------------------------- | ------------------------- |
| `SHIFT + PageUp`           | Scroll up one page        |
| `SHIFT + PageDown`         | Scroll down one page      |
| `CTRL + SHIFT + UpArrow`   | Scroll to previous prompt |
| `CTRL + SHIFT + DownArrow` | Scroll to next prompt     |

---

## Quick Select

| Key                    | Action       |
| ---------------------- | ------------ |
| `CTRL + SHIFT + Space` | Quick Select |

---

## Leader Key System

Leader key: `SUPER_REV + Space`
Modal and persistent until exited.

Exit with `Escape` or `Space`.

---

## Leader Mode — Pane Control

| Key | Action                         |
| --- | ------------------------------ |
| `h` | Move focus left                |
| `j` | Move focus down                |
| `k` | Move focus up                  |
| `l` | Move focus right               |
| `H` | Resize left                    |
| `J` | Resize down                    |
| `K` | Resize up                      |
| `L` | Resize right                   |
| `\` | Split horizontally             |
| `-` | Split vertically               |
| `z` | Toggle zoom                    |
| `x` | Close current pane (confirm)   |
| `b` | Rotate panes clockwise         |
| `B` | Rotate panes counter-clockwise |

---

## Leader Mode — Tab Control

| Key | Action                        |
| --- | ----------------------------- |
| `t` | Spawn tab (CurrentPaneDomain) |
| `n` | Next tab                      |
| `p` | Previous tab                  |
| `c` | Close current tab (confirm)   |

---

## Mouse Bindings

| Input             | Action                                      |
| ----------------- | ------------------------------------------- |
| Left Click        | Complete selection to clipboard and primary |
| CTRL + Left Click | Open link at cursor                         |
| Triple Left Click | Select semantic zone                        |

---

## Notes

* Default WezTerm keybindings are disabled.
* All mappings are collision-safe. Duplicate bindings trigger an error at startup.
* The layout mirrors Neovim navigation patterns.
* Background and opacity toggles integrate with the `backdrops` module.
* Modifier behavior is platform-aware.
