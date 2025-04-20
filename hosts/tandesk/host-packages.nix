{pkgs, inputs, ...}: {
  environment.systemPackages = with pkgs; [
    audacity
    legcord
    nodejs
    obs-studio
    vscode
    direnv
    inputs.zen-browser.packages."${system}".default
    spotify
    blender
    devenv
    vivaldi
    (python3.withPackages (ps: [ ps.psutil ]) )
    mkvtoolnix
  ];
}
