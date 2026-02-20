<div align="center">

  <img src="./wzterm.png" alt="WezTerm Development Environment" width="1000"/>

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

A structured and modular **WezTerm configuration** crafted for developers who value speed, clarity, and full control over their terminal workflow.

---

## Core Goals

* Clean and maintainable architecture
* Consistent cross-platform experience
* Modal keybindings powered by a leader system
* Intelligent pane navigation
* Safe and extensible structure

---

## What Is WezTerm

[WezTerm](https://wezfurlong.org/wezterm/) is a GPU-accelerated terminal emulator and multiplexer written in Rust.

It provides:

* Multiple tabs and split panes
* Cross-platform support (macOS, Linux, Windows, BSD)
* Lua-based configuration
* Native SSH and WSL integration
* High-performance GPU rendering

---

## Features

* GPU-accelerated rendering
* Dynamic background system
* Custom color schemes
* Cross-platform modifier abstraction
* Event-driven status line
* Native WSL integration on Windows
* Font scaling controls
* Pane resizing and swapping

---

## Installation

Follow the instructions for your platform.

---

<details>

<summary><strong>Linux and macOS</strong></summary>

## macOS

Install using Homebrew:

```bash
brew install wezterm
```

---

## Ubuntu or Debian

```bash
sudo apt update
sudo apt install wezterm
```

---

## Arch Linux

Install from the community repository:

```bash
sudo pacman -S wezterm
```

If the package is unavailable in your repositories, follow the [official guide](https://wezfurlong.org/wezterm/installation.html)

</details>

---

<details>

<summary><strong>Windows</strong></summary>

Install using one of the following package managers:

## winget

```powershell
winget install wez.wezterm
```

## Chocolatey

```powershell
choco install wezterm
```

## Scoop

```powershell
scoop install wezterm
```

Alternatively, download the latest release from the [official website](https://wezterm.org/install/windows.html).

</details>

---

## Configuration Setup

After installing WezTerm, replace your existing configuration with this one.

---

<details>
<summary><strong>Linux and macOS configuration</strong></summary>

## Linux or macOS

### 1. Back up your existing configuration

```bash
mv ~/.config/wezterm ~/.config/wezterm.bak
```

### 2. Clone this repository

```bash
git clone https://github.com/hetfs/wezterm ~/.config/wezterm
```

### 3. Remove Git history (optional)

```bash
rm -rf ~/.config/wezterm/.git
```

</details>

---

<details>
<summary><strong>Windows configuration</strong></summary>

## Windows (PowerShell)

### 1. Back up your existing configuration

```powershell
Move-Item $env:USERPROFILE\.config\wezterm $env:USERPROFILE\.config\wezterm.bak
```

### 2. Clone this repository

```powershell
git clone https://github.com/hetfs/wezterm $env:USERPROFILE\.config\wezterm
```

### 3. Remove Git history (optional)

```powershell
Remove-Item $env:USERPROFILE\.config\wezterm\.git -Recurse -Force
```

</details>

---

## Launching WezTerm

```powershell
wezterm
```

WezTerm automatically loads its configuration from:

```bash
$HOME/.config/wezterm/wezterm.lua
```

The `WEZTERM_CONFIG_DIR` environment variable points to the directory containing `wezterm.lua`.
Use it when extending or debugging your setup.

To quickly open your configuration directory from within WezTerm:

```text
Ctrl + `
```

> This key combination is mapped to `Ctrl + ~`.

---

# Modifier Abstraction

| Name           | macOS Mapping | Windows/Linux Mapping |
| -------------- | ------------- | --------------------- |
| `SUPER`        | ⌘ Command     | Alt                   |
| `SUPER + CTRL` | ⌘ + Ctrl      | Alt + Ctrl            |
| `LEADER`       | SUPER + Space | Ctrl + Space          |

`LEADER` is defined as `Space` combined with `SUPER + CTRL`.

---

## Editable Modules

You can safely customize the following modules:

* Keybindings → `config/bindings.lua`
* Fonts → `config/fonts.lua`
* Appearance → `config/appearance.lua`
* Background behavior → `utils/backdrops.lua`
* Status line events → `events/`

The modular structure allows you to experiment without impacting unrelated components.

---

## Documentation

* Full `bindings.lua` reference: [Bindings Documentation](./docs/bindings.md)
* Example modular keybinding system: [example-keybindings](./docs/example-keys.lua)
* Architecture overview: [Architecture](./docs/architecture.md)
* Official [default key assignments](https://wezterm.org/config/default-keys.html)

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

**Guiding principles**

* Intentional key design
* Modal interaction
* Cross-platform reliability
* Clean internal architecture
* Long-term maintainability

---

## ☕ Support My Work

<div align="center">

[![Support: Buy Me a Coffee](https://img.shields.io/badge/Support-Buy_Me_a_Coffee-FFDD00?style=for-the-badge\&logo=buymeacoffee\&logoColor=black)](https://www.buymeacoffee.com/hetfs01f)

[![Facebook](https://raw.githubusercontent.com/maurodesouza/profile-readme-generator/master/src/assets/icons/social/facebook/default.svg)](https://m.facebook.com/profile.php?id=100090714730738)
[![Telegram](https://raw.githubusercontent.com/maurodesouza/profile-readme-generator/master/src/assets/icons/social/telegram/default.svg)](https://t.me/+h941uu74P6I0NDY0)
[![LinkedIn](https://raw.githubusercontent.com/maurodesouza/profile-readme-generator/master/src/assets/icons/social/linkedin/default.svg)](https://linkedin.com)
[![X/Twitter](https://raw.githubusercontent.com/maurodesouza/profile-readme-generator/master/src/assets/icons/social/twitter/default.svg)](https://x.com/hetf01)
[![YouTube](https://raw.githubusercontent.com/maurodesouza/profile-readme-generator/master/src/assets/icons/social/youtube/default.svg)](https://youtube.com/@mastercli)

</div>

---

## Star History

[![Star History Chart](https://api.star-history.com/svg?repos=hetfs/wezterm.git\&type=timeline\&legend=top-left)](https://www.star-history.com/#hetfs/wezterm.git&type=timeline&legend=top-left)
