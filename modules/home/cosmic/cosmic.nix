{
  host,
  config,
  pkgs,
  lib,
  ...
}: let
  inherit (import ../../../hosts/${host}/variables.nix) cosmicEnable;
in {
  home.packages = with pkgs; lib.optionals cosmicEnable [
    cosmic-applibrary
    cosmic-comp
    cosmic-edit
    cosmic-files
    cosmic-icons
    cosmic-launcher
    cosmic-notifications
    cosmic-osd
    cosmic-panel
    cosmic-settings
    cosmic-term
    cosmic-workspaces-epoch
    cosmic-bg
    cosmic-idle
    cosmic-store
    cosmic-randr
    cosmic-player
    cosmic-greeter
    cosmic-ext-ctl
    cosmic-applets
    cosmic-protocols
    cosmic-wallpapers
    cosmic-screenshot
    cosmic-ext-tweaks
    cosmic-ext-calculator
    cosmic-settings-daemon
  ];

  # Enable COSMIC desktop
  xdg.portal.extraPortals = lib.optionals cosmicEnable [pkgs.xdg-desktop-portal-cosmic];

  # Place Files Inside Home Directory
  home.file = lib.optionalAttrs cosmicEnable {
    "Pictures/Wallpapers" = {
      source = ../../../wallpapers;
      recursive = true;
    };
  };

  # Enable COSMIC session
  systemd.user.services = lib.optionalAttrs cosmicEnable {
    cosmic-session = {
      Unit = {
        Description = "COSMIC Desktop Session";
        After = ["graphical-session-pre.target"];
        PartOf = ["graphical-session.target"];
      };
      Service = {
        ExecStart = "${pkgs.cosmic-session}/bin/cosmic-session";
        Restart = "on-failure";
      };
      Install = {
        WantedBy = ["graphical-session.target"];
      };
    };
  };

  # Set environment variables
  home.sessionVariables = lib.optionalAttrs cosmicEnable {
    XDG_CURRENT_DESKTOP = "COSMIC";
    XDG_SESSION_DESKTOP = "COSMIC";
  };
} 