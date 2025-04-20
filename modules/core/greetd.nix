{
  pkgs,
  username,
  ...
}: {
  services.greetd = {
    enable = true;
    vt = 3;
    settings = {
      default_session = {
        user = "${username}";
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --remember --cmd Hyprland"; # start Hyprland with a TUI login manager in 1440p
      };
    };
  };
}