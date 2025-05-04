{ host, pkgs, ... }: let
  inherit (import ../../hosts/${host}/variables.nix) steamEnable;
in {
  programs = {
    steam = {
      enable = steamEnable;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = false;
      gamescopeSession.enable = steamEnable;
      extraCompatPackages = [pkgs.proton-ge-bin];
    };
    gamemode.enable = steamEnable;
    gamescope = {
      enable = steamEnable;
      capSysNice = true;
      args = [
        "--rt"
        "--expose-wayland"
      ];
    };
  };
}
