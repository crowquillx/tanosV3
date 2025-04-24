{pkgs, inputs, ...}: {
  environment.systemPackages = with pkgs; [
    audacity
    vesktop
    nodejs
    obs-studio
    vscode-fhs
    direnv
    inputs.zen-browser.packages."${system}".default
    spotify
    blender
    devenv
    vivaldi
    mkvtoolnix
    aegisub
    godot
  ];
}
