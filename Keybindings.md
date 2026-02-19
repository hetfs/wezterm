# WezTerm Key Bindings

*Neovim-Native Workflow*

This document reflects the current `bindings.lua` configuration.
Default [Key Assignments](https://wezterm.org/config/default-keys.html?h=ke) are fully disabled.

---

## Modifier Model

| Name        | macOS Mapping     | Windows / Linux Mapping |
| ----------- | ----------------- | ----------------------- |
| `SUPER`     | ⌘ Command         | Alt                     |
| `SUPER_REV` | ⌘ + Ctrl          | Alt + Ctrl              |
| `LEADER`    | SUPER_REV + Space | SUPER_REV + Space       |

**Leader key definition**

```bash
Leader = SUPER_REV + Space
```

**Platform mappings**

```bash
# macOS:
Cmd + Ctrl + Space

# Windows / Linux:
Alt + Ctrl + Space
```

---

# System & Global

| Key           | Action                   |
| ------------- | ------------------------ |
| `F1`          | Activate Copy Mode       |
| `F2`          | Open Command Palette     |
| `F3`          | Show Launcher            |
| `F4`          | Fuzzy Tab Launcher       |
| `F5`          | Fuzzy Workspace Launcher |
| `F11`         | Toggle Fullscreen        |
| `F12`         | Show Debug Overlay       |
| `ALT + Enter` | Toggle Fullscreen        |
| `SUPER + m`   | Hide window              |
| `SUPER + n`   | Spawn new window         |

---

# Search & Selection

| Key                    | Action                              |
| ---------------------- | ----------------------------------- |
| `SUPER + f`            | Search (case insensitive)           |
| `CTRL + SHIFT + F`     | Search current selection            |
| `CTRL + SHIFT + Space` | Quick Select                        |
| `SUPER + u`            | Detect and open URL under selection |

url detection supports:

* `(https://...)`
* `[https://...]`
* `{https://...}`
* `<https://...>`
* raw urls

---

# clipboard

| key              | action                  |
| ---------------- | ----------------------- |
| `ctrl + c`       | copy                    |
| `super + c`      | copy                    |
| `ctrl + v`       | paste                   |
| `super + v`      | paste                   |
| `shift + insert` | paste primary selection |
| `ctrl + insert`  | copy primary selection  |
| `copy` key       | copy                    |
| `paste` key      | paste                   |

---

# font controls

| key                      | action             |
| ------------------------ | ------------------ |
| `ctrl + =` or `ctrl + +` | increase font size |
| `ctrl + -`               | decrease font size |
| `ctrl + 0`               | reset font size    |

---

# tab navigation

| key                  | action           |
| -------------------- | ---------------- |
| `ctrl + tab`         | next tab         |
| `ctrl + shift + tab` | previous tab     |
| `super + [`          | previous tab     |
| `super + ]`          | next tab         |
| `ctrl + 1–5`         | activate tab 1–5 |

---

# tab management

| key             | action                         |
| --------------- | ------------------------------ |
| `super + t`     | spawn tab (defaultdomain)      |
| `super_rev + t` | spawn wsl ubuntu tab           |
| `super_rev + w` | close current tab (no confirm) |
| `super_rev + [` | move tab left                  |
| `super_rev + ]` | move tab right                 |

---

# pane management

## split

| key             | action           |
| --------------- | ---------------- |
| `super + \`     | vertical split   |
| `super_rev + \` | horizontal split |

## focus

| key             | action      |
| --------------- | ----------- |
| `super_rev + h` | focus left  |
| `super_rev + j` | focus down  |
| `super_rev + k` | focus up    |
| `super_rev + l` | focus right |

## control

| key             | action               |
| --------------- | -------------------- |
| `super + w`     | close pane (confirm) |
| `ctrl + z`      | toggle zoom          |
| `ctrl + x`      | activate copy mode   |
| `super_rev + p` | pane swap selector   |

---

# background controls

| key             | action                    |
| --------------- | ------------------------- |
| `super + /`     | random background         |
| `super + ,`     | previous background       |
| `super + .`     | next background           |
| `super_rev + /` | fuzzy background selector |

---

# leader mode

leader: `super_rev + space`
modal until exited with `escape` or `q`.

---

## leader — pane navigation

| key | action      |
| --- | ----------- |
| `h` | focus left  |
| `j` | focus down  |
| `k` | focus up    |
| `l` | focus right |

---

## leader — resize panes

| key | action       |
| --- | ------------ |
| `h` | resize left  |
| `j` | resize down  |
| `k` | resize up    |
| `l` | resize right |

---

## leader — pane actions

| key | action                        |
| --- | ----------------------------- |
| `\` | split horizontally            |
| `-` | split vertically              |
| `c` | spawn tab (currentpanedomain) |
| `q` | close pane (confirm)          |

---

# key tables

## resize font mode

| key            | action        |
| -------------- | ------------- |
| `k`            | increase font |
| `j`            | decrease font |
| `r`            | reset font    |
| `q` / `escape` | exit mode     |

## resize pane mode

| key            | action       |
| -------------- | ------------ |
| `h`            | resize left  |
| `j`            | resize down  |
| `k`            | resize up    |
| `l`            | resize right |
| `q` / `escape` | exit mode    |

---

# mouse bindings

| input               | action                        |
| ------------------- | ----------------------------- |
| left click release  | copy to clipboard and primary |
| `ctrl + left click` | open link under cursor        |
| triple left click   | select semantic zone          |

---

# notes

* all default bindings are disabled.
* super is platform-aware.
* navigation mirrors neovim conventions.
* background selection integrates with the `backdrops` module.
* pane and tab control are optimized for modal workflows.
