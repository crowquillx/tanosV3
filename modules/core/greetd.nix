{ host, pkgs, username, ... }: let
  inherit (import ../../hosts/${host}/variables.nix) greetdEnable;
in {
  services.greetd = {
    enable = greetdEnable;
    vt = 3;
    settings = {
      default_session = {
        user = "${username}";
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --remember --cmd Hyprland"; # start Hyprland with a TUI login manager in 1440p
      };
    };
  };
}