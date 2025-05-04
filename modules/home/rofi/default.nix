{ host, ... }: let
  inherit (import ../../../hosts/${host}/variables.nix) enableRofi;
in {
  imports = [
    ./config-long.nix
    ./rofi.nix
  ];
}
