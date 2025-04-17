{pkgs, inputs, ...}: {
  environment.systemPackages = with pkgs; [
    audacity
    vesktop
    nodejs
    obs-studio
    vscode
    direnv
    inputs.zen-browser.packages."${system}".default
    spotify
    blender
    devenv
    (python3.withPackages (ps: [ ps.psutil ]) )
    mkvtoolnix
  ];
}
