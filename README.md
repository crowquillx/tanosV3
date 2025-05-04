# 🚀 tanOS

<div align="center">

[![NixOS](https://img.shields.io/badge/NixOS-23.11+-blue.svg)](https://nixos.org)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

</div>

A personalized fork of [zaneyos](https://gitlab.com/Zaney) that is becoming more divergent over time. This repository is primarily maintained for personal use but is kept public to enable the use of the installation script.

## 📋 Prerequisites

- NixOS version 23.11 or higher
- `tanos` folder (this repository) must be in your home directory
- GPT partition with UEFI boot
- Minimum 500MB `/boot` partition
- Systemd-boot (other bootloaders will require modifications)

## 🛠️ Installation Guide

### Quick Installation

1. Install required packages:
   ```bash
   nix-shell -p git curl
   ```

2. Run the installation script:
   ```bash
   sh <(curl -L https://raw.githubusercontent.com/crowquillx/tanosV3/refs/heads/main/install-tanos.sh)
   ```

3. Reboot your system after installation completes

### Manual Installation

1. Install required packages:
   ```bash
   nix-shell -p git vim
   ```

2. Clone and enter the repository:
   ```bash
   cd && git clone https://github.com/crowquillx/tanosV3.git
   cd tanos
   ```

3. Create your host configuration:
   ```bash
   cp -r hosts/default hosts/<your-desired-hostname>
   ```

4. Configure your system:
   - Edit `hosts/<your-desired-hostname>/variables.nix`
   - Edit `flake.nix` with your username, profile, and hostname
   - Generate hardware configuration:
     ```bash
     nixos-generate-config --show-hardware-config > hosts/<your-desired-hostname>/hardware.nix
     ```

5. Enable flakes and install:
   ```bash
   NIX_CONFIG="experimental-features = nix-command flakes" 
   sudo nixos-rebuild switch --flake .#profile
   ```

> 💡 **Tip:** After installation, you can use the `fr` alias to rebuild your configuration from anywhere.

## 🙏 Acknowledgments

Special thanks to the following contributors and inspirations:

- [Tyler Kelley (Zaney)](https://gitlab.com/Zaney)
  - [YouTube](https://www.youtube.com/@ZaneyOG)
  - [Patreon](https://www.patreon.com/akazaney)
  - [Website](https://zaney.org/)
- [Jakookit](https://github.com/jakookit)
- [Justaguylinux](https://github.com/drewgrif)
- [Jerry Starke](https://github.com/JerrySM64)