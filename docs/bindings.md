# Key Bindings Guide

This document explains the custom keybindings in your WezTerm configuration. It is designed for beginners to quickly understand and use the terminal efficiently.

---

## Platform Modifiers

The configuration uses **platform-specific modifiers** to handle differences between macOS, Windows, and Linux:

| Modifier    | macOS             | Windows/Linux     |
| ----------- | ----------------- | ----------------- |
| `SUPER`     | ⌘ Command         | Alt               |
| `SUPER_REV` | ⌘ + Ctrl          | Alt + Ctrl        |
| `LEADER`    | Space + SUPER_REV | Space + SUPER_REV |

`LEADER` is a **leader key** mode that allows you to perform additional commands by pressing Space + SUPER_REV first.

---

## Opening Configuration

| Shortcut   | Action                                                               |
| ---------- | -------------------------------------------------------------------- |
| CTRL + ` | Open WezTerm configuration in your editor (uses `$EDITOR` or `nvim`) |

> This opens the config directory in a **new tab**. You can adjust the spawn strategy to open in a new window or current pane.

---

## Function Keys

| Key | Action                             |
| --- | ---------------------------------- |
| F1  | Enter **copy mode**                |
| F2  | Open **command palette**           |
| F3  | Open **launcher**                  |
| F4  | Launcher with **tabs filter**      |
| F5  | Launcher with **workspace filter** |
| F11 | Toggle **fullscreen**              |
| F12 | Show **debug overlay**             |

---

## Search & Quick Select

| Shortcut               | Action                                   |
| ---------------------- | ---------------------------------------- |
| `SUPER + f`            | Search text (case-insensitive)           |
| `SUPER + F`            | Search current selection or empty string |
| `SHIFT + CTRL + Space` | Quick select                             |
| `SUPER + u`            | Quick select URL under cursor            |

> Quick select URLs will automatically open in your default browser.

---

## Clipboard Shortcuts

| Shortcut                 | Action                       |
| ------------------------ | ---------------------------- |
| `CTRL + C` / `SUPER + c` | Copy to clipboard            |
| `CTRL + V` / `SUPER + v` | Paste from clipboard         |
| `SHIFT + Insert`         | Paste from primary selection |
| `CTRL + Insert`          | Copy to primary selection    |
| `Copy` / `Paste`         | Copy/Paste without modifiers |

---

## Tab Management

| Shortcut              | Action                              |
| --------------------- | ----------------------------------- |
| `CTRL + Tab`          | Next tab                            |
| `SHIFT + CTRL + Tab`  | Previous tab                        |
| `SUPER + t`           | Open new tab (default domain)       |
| `SUPER_REV + t`       | Open new tab (WSL Ubuntu domain)    |
| `SUPER_REV + w`       | Close current tab (no confirmation) |
| `SUPER + [` / `]`     | Navigate tabs                       |
| `SUPER_REV + [` / `]` | Move tabs left/right                |
| `CTRL + 1..5`         | Activate tab by number              |

---

## Window Management

| Shortcut      | Action            |
| ------------- | ----------------- |
| `ALT + Enter` | Toggle fullscreen |
| `SUPER + m`   | Hide window       |
| `SUPER + n`   | Open new window   |

---

## Font Size Control

Use these shortcuts to quickly adjust the font size:

| Shortcut   | Action                |
| ---------- | --------------------- |
| `CTRL + =` | Increase font size    |
| `CTRL + -` | Decrease font size    |
| `CTRL + 0` | Reset to default size |

> You can modify the default font configuration in [`config/fonts.lua`](../config/fonts.lua).

---

## pane management

| shortcut              | action                                |
| --------------------- | ------------------------------------- |
| `super + \`           | split vertical pane                   |
| `super_rev + \`       | split horizontal pane                 |
| `super_rev + z`       | toggle pane zoom                      |
| `super_rev + h/j/k/l` | navigate panes (left/down/up/right)   |
| `super_rev + h/j/k/l` | resize panes by 3 cells               |
| `super_rev + p`       | swap with active pane (pane selector) |
| `super + w`           | close current pane                    |

> optional **leader** bindings allow similar navigation without pressing super directly.

---

## background control

| shortcut        | action                      |
| --------------- | --------------------------- |
| `super + /`     | random background           |
| `super + ,`     | previous background         |
| `super + .`     | next background             |
| `super_rev + /` | select background from menu |

---

## mouse bindings

| action                 | mouse & modifiers |
| ---------------------- | ----------------- |
| copy selection         | left click        |
| open link under cursor | ctrl + left click |
| select text at cursor  | triple-click left |

---

## leader key mode

the **leader key** is:

```
space + super_rev
```

after pressing it, you can trigger special pane or tab actions (currently commented out for optional use).

*example*:

```lua
-- activate left pane:
 { key = "h", mods = "leader", action = act.activatepanedirection("left") }
```

> using leader mode reduces conflicts with normal keybindings and allows modal commands similar to vim.

---

## summary

this keybindings configuration provides:

* easy access to configuration files
* quick navigation for tabs and panes
* clipboard and font control
* search and quick selection features
* dynamic background management
* cross-platform consistency with super / super_rev

by mastering these shortcuts, you can navigate wezterm efficiently like a pro.
