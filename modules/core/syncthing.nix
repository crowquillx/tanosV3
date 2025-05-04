{ host, username, ... }: let
  inherit (import ../../hosts/${host}/variables.nix) syncthingEnable;
in {
  services.syncthing = {
    enable = syncthingEnable;
    user = "${username}";
    dataDir = "/home/${username}";
    configDir = "/home/${username}/.config/syncthing";
  };
}
