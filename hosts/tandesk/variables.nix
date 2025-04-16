{
  # Git Configuration ( For Pulling Software Repos )
  gitUsername = "Tyler Kelley";
  gitEmail = "tylerzanekelley@gmail.com";

  # Hyprland Settings
  extraMonitorSettings = "
monitor=DP-1,2560x1440@165,2560x1080,auto,vrr,1
monitor=DP-2,2560x1440@144,0x1080,auto
monitor=DP-3,1920x1080@144,2560x0,auto
monitor=HDMI-A-1,disabled";

  # Waybar Settings
  clock24h = false;

  # Program Options
  browser = "zen-beta"; # Set Default Browser (google-chrome-stable for google-chrome)
  terminal = "kitty"; # Set Default System Terminal
  keyboardLayout = "us";
  consoleKeyMap = "us";

  # For Nvidia Prime support
  intelID = "PCI:1:0:0";
  nvidiaID = "PCI:0:2:0";

  # Enable NFS
  enableNFS = true;

  # Enable Printing Support
  printEnable = false;

  # Set Stylix Image
  stylixImage = ../../wallpapers/AnimeGirlNightSky.jpg;

  # Set Waybar
  # Includes alternates such as waybar-curved.nix & waybar-ddubs.nix
  waybarChoice = ../../modules/home/waybar/waybar-curved.nix;

  # Set Animation style
  # Available options are:
  # animations-def.nix  (default)
  # animations-end4.nix (end-4 project)
  # animations-dynamic.nix (ml4w project)
  animChoice = ../../modules/home/hyprland/animations-end4.nix;

  # Enable Thunar GUI File Manager
  thunarEnable = true;
}
