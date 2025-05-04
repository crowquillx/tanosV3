{ host, profile, ... }: let
  inherit (import ../../hosts/${host}/variables.nix) 
    libinputEnable
    fstrimEnable
    gvfsEnable
    opensshEnable
    bluemanEnable
    tumblerEnable
    gnomeKeyringEnable
    smartdEnable
    pipewireEnable;
in {
  # Services to start
  services = {
    libinput.enable = libinputEnable; # Input Handling
    fstrim.enable = fstrimEnable; # SSD Optimizer
    gvfs.enable = gvfsEnable; # For Mounting USB & More
    openssh.enable = opensshEnable; # Enable SSH
    blueman.enable = bluemanEnable; # Bluetooth Support
    tumbler.enable = tumblerEnable; # Image/video preview
    gnome.gnome-keyring.enable = gnomeKeyringEnable;

    smartd = {
      enable =
        if profile == "vm"
        then false
        else smartdEnable;
      autodetect = true;
    };
    pipewire = {
      enable = pipewireEnable;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };
}
