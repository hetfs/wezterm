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

| Shortcut   | Action             |
| ---------- | ------------------ |
| `CTRL + =` | Increase font size |
| `CTRL + -` | Decrease font size |
| `CTRL + 0` | Reset font size    |

---

## Pane Management

| Shortcut              | Action                                |
| --------------------- | ------------------------------------- |
| `SUPER + \`           | Split vertical pane                   |
| `SUPER_REV + \`       | Split horizontal pane                 |
| `SUPER_REV + z`       | Toggle pane zoom                      |
| `SUPER_REV + h/j/k/l` | Navigate panes (Left/Down/Up/Right)   |
| `SUPER_REV + H/J/K/L` | Resize panes by 3 cells               |
| `SUPER_REV + p`       | Swap with active pane (pane selector) |
| `SUPER + w`           | Close current pane                    |

> Optional **LEADER** bindings allow similar navigation without pressing SUPER directly.

---

## Background Control

| Shortcut        | Action                      |
| --------------- | --------------------------- |
| `SUPER + /`     | Random background           |
| `SUPER + ,`     | Previous background         |
| `SUPER + .`     | Next background             |
| `SUPER_REV + /` | Select background from menu |

---

## Mouse Bindings

| Action                 | Mouse & Modifiers |
| ---------------------- | ----------------- |
| Copy selection         | Left click        |
| Open link under cursor | CTRL + Left click |
| Select text at cursor  | Triple-click Left |

---

## Leader Key Mode

The **leader key** is:

```
Space + SUPER_REV
```

After pressing it, you can trigger special pane or tab actions (currently commented out for optional use).

*Example*:

```lua
-- Activate left pane:
 { key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") }
```

> Using leader mode reduces conflicts with normal keybindings and allows modal commands similar to Vim.

---

## Summary

This keybindings configuration provides:

* Easy access to configuration files
* Quick navigation for tabs and panes
* Clipboard and font control
* Search and quick selection features
* Dynamic background management
* Cross-platform consistency with SUPER / SUPER_REV

By mastering these shortcuts, you can navigate WezTerm efficiently like a pro.
