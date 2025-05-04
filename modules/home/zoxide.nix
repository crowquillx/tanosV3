{ host, zoxideEnable, ... }: {
  programs.zoxide = {
    enable = zoxideEnable;
    enableZshIntegration = true;
    enableBashIntegration = true;
    options = [
      "--cmd cd"
    ];
  };
}

