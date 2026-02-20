<div align="center">

  <img src="./wzterm.png" alt="WezTerm Dev Environment" width="1000"/>

</div>

---

<div align="center">

[![WezTerm](https://img.shields.io/badge/WezTerm-Terminal%20Emulator-blue?logo=wezterm)](https://wezterm.org/)
[![License: MIT](https://img.shields.io/badge/License-MIT-green)](LICENSE)
[![Written in Lua](https://img.shields.io/badge/Config-Lua-2C2D72?logo=lua)](https://www.lua.org/about.html)
[![GitHub Stars](https://img.shields.io/github/stars/hetfs/wezterm?style=social)](https://github.com/hetfs/wezterm/stargazers)
[![GitHub Issues](https://img.shields.io/github/issues/hetfs/wezterm)](https://github.com/hetfs/wezterm/issues)

</div>

---

wezterm **configuration**, built for developers who value speed, clarity, and complete control over their terminal workflow.

---

## Core Goals

* Clean and maintainable architecture
* Cross-platform consistency
* Modal keybindings with leader modes
* Intelligent pane navigation
* Structured and safe extensibility

---

## What Is WezTerm

WezTerm is a GPU-accelerated terminal emulator and multiplexer written in Rust. It provides:

* Multiple tabs and split panes
* Cross-platform support (macOS, Linux, Windows, BSD)
* Lua-based configuration
* Native SSH and WSL integration
* High-performance GPU rendering

Official documentation:
[https://wezfurlong.org/wezterm/](https://wezfurlong.org/wezterm/)

---

## ✨ Features

* GPU-accelerated rendering
* Dynamic background system
* Custom color schemes
* Cross-platform modifier abstraction
* Event-driven status line
* Native WSL integration on Windows
* Font scaling
* Pane resizing
* Pane swapping

---

## 🛠 Installation

Follow the instructions for your platform.

---

### macOS

Install using Homebrew:

```bash
brew install wezterm
```

---

### Ubuntu / Debian

```bash
sudo apt update
sudo apt install wezterm
```

If the package is unavailable in your repositories, use the official guide:
[https://wezfurlong.org/wezterm/installation.html](https://wezfurlong.org/wezterm/installation.html)

---

### Windows

Install using Windows Package Manager:

```powershell
winget install wez.wezterm
```

---

## Configuration Setup

After installing WezTerm, replace your existing configuration with this one.

---

## Linux / macOS

### 1. Back up existing configuration

```bash
mv ~/.config/wezterm ~/.config/wezterm.bak
```

### 2. Clone this configuration

```bash
git clone https://github.com/hetfs/wezterm ~/.config/wezterm
```

### 3. Remove Git history (optional)

If you plan to manage this setup inside your own repository:

```bash
rm -rf ~/.config/wezterm/.git
```

---

## Windows

### 1. Back up existing configuration on Windows

```powershell
Move-Item $env:USERPROFILE\.config\wezterm $env:USERPROFILE\.config\wezterm.bak
```

### 2. Clone this configuration in powershell

```powershell
git clone https://github.com/hetfs/wezterm  $env:USERPROFILE\.config\wezterm
```

### 3. Remove Git history on Windows (optional)

```powershell
Remove-Item $env:USERPROFILE\.config\wezterm\.git -Recurse -Force
```

---

## Launching WezTerm

WezTerm automatically loads its configuration from:

```
$HOME/.config/wezterm/wezterm.lua
```

The `WEZTERM_CONFIG_DIR` environment variable points to the directory containing `wezterm.lua`.
Use it when extending or debugging your setup.

To quickly open your configuration directory from within WezTerm:

```bash
# customize keybinding
CTRL + ~
```

---

# Customization

## Modifier Abstraction

| Name     | macOS Mapping | Windows/Linux Mapping |            |
| -------- | ------------- | --------------------- | ---------- |
| `SUPER`  | ⌘ Command     | Alt                   |            |
| `SUPER   | CTRL`         | ⌘ + Ctrl              | Alt + Ctrl |
| `LEADER` | SUPER + Space | Ctrl + Space          |            |

`LEADER` is defined as `Space` combined with `SUPER|CTRL`.

---

## Editable Modules

You can safely customize the following:

* Keybindings → `config/bindings.lua`
* Fonts → `config/fonts.lua`
* Appearance → `config/appearance.lua`
* Background behavior → `utils/backdrops.lua`
* Status line events → `events/`

The modular structure allows experimentation without affecting unrelated components.

*Documentation*:

* Full `bindings.lua` customization reference: [document](./docs/bindings.md)
* Example `example-key.lua` for designing a modular keybinding system: [example keybindings](./docs/example-keys.lua)
* Check the [Architecture](./docs/architecture.md) overview
* For advanced platform-specific details, see [official default key assignments](https://wezterm.org/config/default-keys.html)

---

## Roadmap

* Multiple theme presets
* Workspace presets
* Plugin-style feature toggles
* Remote SSH workspace templates
* Performance profiling presets

---

## Philosophy

This configuration is designed as a structured project rather than a single-file dotfile.

*Guiding principles*:

* Intentional key design
* Modal interaction
* Cross-platform reliability
* Clean internal architecture
* Long-term maintainability

---

## Star History

[![Star History Chart](https://api.star-history.com/svg?repos=hetfs/wezterm.git\&type=timeline\&legend=top-left)](https://www.star-history.com/#hetfs/wezterm.git&type=timeline&legend=top-left)
