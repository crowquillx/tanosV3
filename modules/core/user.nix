{
  pkgs,
  inputs,
  username,
  host,
  profile,
  ...
}: let
  inherit (import ../../hosts/${host}/variables.nix) gitUsername;
in {
  imports = [inputs.home-manager.nixosModules.home-manager];
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = false;
    backupFileExtension = "backup";  # Removed duplicate entry
    extraSpecialArgs = {inherit inputs username host profile;};
    users.${username} = {
      imports = [./../home];
      home = {
        username = "${username}";
        homeDirectory = "/home/${username}";
        stateVersion = "23.11";
      };
      programs.home-manager.enable = true;
      
      # Adding xdg-user-dirs configuration
      xdg = {
        enable = true;
        userDirs = {
          enable = true;
          createDirectories = true;  # Set to false if you don't want auto-creation
          # Optional: customize directory locations
          # desktop = "$HOME/Desktop";
          # documents = "$HOME/Documents";
          # download = "$HOME/Downloads";
          # music = "$HOME/Music";
          # pictures = "$HOME/Pictures";
          # publicShare = "$HOME/Public";
          # templates = "$HOME/Templates";
          # videos = "$HOME/Videos";
        };
      };
    };
  };
  
  users.mutableUsers = true;
  users.users.${username} = {
    isNormalUser = true;
    description = "${gitUsername}";
    extraGroups = [
      "adbusers"
      "docker"
      "libvirtd"
      "lp"
      "networkmanager"
      "scanner"
      "wheel"
    ];
    shell = pkgs.zsh;
    ignoreShellProgramCheck = true;
  };
  nix.settings.allowed-users = ["${username}"];
}