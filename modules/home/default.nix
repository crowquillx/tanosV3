{ inputs, config, pkgs, host, ... }: let
  inherit (import ../../hosts/${host}/variables.nix) 
    ghosttyEnable
    wlogoutEnable
    hyprlandEnable
    hyprlockEnable
    hypridleEnable
    nvfEnable
    weztermEnable
    kittyEnable
    waybarChoice
    waybarEnable
    zoxideEnable
    cosmicEnable;
in {
  imports = [
    ./amfora.nix
    ./bash.nix
    ./bashrc-personal.nix
    ./bat.nix
    ./btop.nix
    ./cava.nix
    ./cosmic
    ./emoji.nix
    ./fastfetch
    ./gh.nix
    ./ghostty.nix
    ./git.nix
    ./gtk.nix
    ./htop.nix
    ./hyprland
    ./kitty.nix
    ./nvf.nix
    ./rofi
    ./qt.nix
    ./scripts
    ./starship.nix
    ./stylix.nix
    ./swappy.nix
    ./swaync.nix
    ./virtmanager.nix
    ./waybar/waybar-ddubs.nix
    ./wezterm.nix
    ./wlogout
    ./xdg.nix
    ./yazi
    ./zoxide.nix
    ./zsh
  ];

  # Pass variables to modules
  _module.args = {
    ghosttyEnable = ghosttyEnable;
    wlogoutEnable = wlogoutEnable;
    hyprlandEnable = hyprlandEnable;
    hyprlockEnable = hyprlockEnable;
    hypridleEnable = hypridleEnable;
    nvfEnable = nvfEnable;
    weztermEnable = weztermEnable;
    kittyEnable = kittyEnable;
    waybarEnable = waybarEnable;
    zoxideEnable = zoxideEnable;
    cosmicEnable = cosmicEnable;
  };
}
