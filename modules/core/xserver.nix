{host, ...}: let
  inherit (import ../../hosts/${host}/variables.nix) 
    xserverEnable
    keyboardLayout;
in {
  services.xserver = {
    enable = xserverEnable;
    xkb = {
      layout = "${keyboardLayout}";
      variant = "";
    };
  };
}
