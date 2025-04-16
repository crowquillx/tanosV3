{ pkgs, config, lanzaboote, lib, inputs, outputs, ... }:

{
  boot = {
    kernelPackages = pkgs.linuxPackages_zen;
    kernelModules = [ "v4l2loopback" ];
    extraModulePackages = [ config.boot.kernelPackages.v4l2loopback ];
    kernel.sysctl = { "vm.max_map_count" = 2147483642; };
    loader.systemd-boot.enable = lib.mkForce false; # Lanzaboote manages systemd-boot
    loader.efi.canTouchEfiVariables = true;
    # Appimage Support
    binfmt.registrations.appimage = {
      wrapInterpreterInShell = false;
      interpreter = "${pkgs.appimage-run}/bin/appimage-run";
      recognitionType = "magic";
      offset = 0;
      mask = ''\xff\xff\xff\xff\x00\x00\x00\x00\xff\xff\xff'';
      magicOrExtension = ''\x7fELF....AI\x02'';
    };
    plymouth.enable = true;
  };

  # Lanzaboote Secure Boot integration
  environment.systemPackages = [ pkgs.sbctl ];
  boot.lanzaboote = {
    enable = true;
    pkiBundle = "/var/lib/sbctl";
    # Optionally, set extra options:
    # pcrBanks = [ "sha256" ];
    # enrollKeys = true;
  };

  # systemd-boot settings via lanzaboote
  boot.loader.systemd-boot.consoleMode = "max";
  boot.loader.systemd-boot.configurationLimit = 5;
}