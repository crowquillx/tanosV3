{pkgs, inputs, ...}: {
  environment.systemPackages = with pkgs; [
    audacity
    vesktop
    nodejs
    obs-studio
    code-cursor
    direnv
    inputs.zen-browser.packages."${system}".default
    spotify
    blender
    devenv
    vivaldi
    mkvtoolnix
    aegisub
    godot
    heroic
    lutris
    protonup-qt
    protontricks
    brave
    qbittorrent
    plex-desktop
    openmw
  ];
}
