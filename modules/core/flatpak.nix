{ host, pkgs, ... }: let
  inherit (import ../../hosts/${host}/variables.nix) flatpakEnable;
in {
  xdg.portal = {
    enable = flatpakEnable;
    extraPortals = [pkgs.xdg-desktop-portal-hyprland];
    configPackages = [pkgs.hyprland];
  };
  services = {
    flatpak.enable = flatpakEnable; # Enable Flatpak
  };
  systemd.services.flatpak-repo = {
    wantedBy = ["multi-user.target"];
    path = [pkgs.flatpak];
    script = ''
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    '';
  };
}
