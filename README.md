# Nix Home Environment (ML4W Companion)

This repository contains a fully declarative **Home Manager flake** designed to provide a robust, modern CLI and development environment on top of non-NixOS distributions (like Ubuntu, Debian, or Arch Linux). It is designed to work seamlessly alongside [ML4W Hyprland dotfiles](https://github.com/mylinuxforwork/dotfiles).

## ✨ Features

- **Modern Shell Environment**: 
  - `Bash` automatically hands off to `Zsh` for an optimal interactive experience.
  - Comes with a custom ASCII "jin" welcome message and automatic OS detection.
- **Terminal Multiplexer**: 
  - `Zellij` starts automatically on interactive shells (unless inside VSCode or SSH).
  - Configured with custom tmux-style keybindings (`Alt` for quick actions, `Ctrl` prefix for core modes).
- **Development Tools (Neovim)**: 
  - Full Neovim configuration with Lua LSP, Treesitter, lazygit integration, tokyonight theme, and more.
- **Modern Terminals**: Configurations for `Ghostty` and `Kitty`.
- **System Utilities**: Pre-configured aliases and packages for `eza`, `bat`, `lazygit`, `fnm`, `yq`, `helm`, `kubectl`, and more.
- **Remote Desktop**: Includes a systemd user service for `wayvnc`.

## 📦 Prerequisites

- A fresh installation of **Ubuntu / Debian** (or another Linux distribution).
- **Git** installed to clone this repository.

## 🚀 Installation (One-Click)

This repository includes a robust `install.sh` script that automates the entire setup. It will automatically install core system dependencies (like Hyprland and Kitty), install the Nix package manager, and deploy the Home Manager configurations tailored to your system username.

1. **Clone the Repository**: 
   Clone this repository to your home directory (e.g., `~/gui/new_home`).
   ```bash
   mkdir -p ~/gui
   git clone https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git ~/gui/new_home
   cd ~/gui/new_home
   ```

2. **Run the Installer**:
   Execute the installation script. It will ask for your `sudo` password to install underlying system packages before handing off to Nix.
   ```bash
   ./install.sh
   ```

3. **Log In**:
   Once the script finishes successfully, simply log out and choose the **Hyprland** session at your login screen. Your fully customized desktop, terminals, and dual-screen dock will be waiting for you!

## 🛠️ Usage & Updating

Once installed, managing your environment is incredibly easy.

- **Updating Configurations**:
  Whenever you modify a `.nix` file in this repository, just run:
  ```bash
  hms
  ```
  *(This is a pre-configured alias for `home-manager switch --flake ~/gui/new_home/#$USER --impure -b backup`)*.

- **Cleaning up Nix Store**:
  Over time, Nix will accumulate old generations of your environment. To safely delete old generations and free up disk space, run:
  ```bash
  nix-clean
  ```

## 📁 Directory Structure

```text
new_home/
├── flake.nix                 # Flake entrypoint (dynamically injects $USER)
├── nix/
│   ├── home.nix              # Main Home Manager entrypoint (imports modules)
│   └── modules/
│       ├── core/             # Base CLI packages and LSP servers
│       ├── desktop/          # Wayvnc, Ghostty, Hyprland interaction logic
│       ├── dev/              # Neovim, Git, Zellij configurations
│       └── shell/            # Zsh, Bash, Nushell, and Welcome scripts
```

## ⚠️ Notes for ML4W Users

- This flake **does not** overwrite your `~/.config/hypr/hyprland.conf` or ML4W lua configurations. It delegates Hyprland window management back to the ML4W dotfiles.
- Running `hms` may occasionally trigger a brief "Config Error" in Hyprland if it hot-reloads during the exact millisecond that Home Manager is relinking `~/.config` files. This is harmless—simply reloading Hyprland or slightly modifying a window will clear it.
