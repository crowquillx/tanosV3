{pkgs, ...}: {
  xdg = {
    enable = true;
    mime.enable = true;
    mimeApps = {
      enable = true;
      associations.added = {
        "x-scheme-handler/http" = [ "zen-beta.desktop" ];
        "x-scheme-handler/https" = [ "zen-beta.desktop" ];
        "x-scheme-handler/chrome" = [ "zen-beta.desktop" ];
        "text/html" = [ "zen-beta.desktop" ];
        "application/x-extension-htm" = [ "zen-beta.desktop" ];
        "application/x-extension-html" = [ "zen-beta.desktop" ];
        "application/x-extension-shtml" = [ "zen-beta.desktop" ];
        "application/xhtml+xml" = [ "zen-beta.desktop" ];
        "application/x-extension-xhtml" = [ "zen-beta.desktop" ];
        "application/x-extension-xht" = [ "zen-beta.desktop" ];
        "application/x-subrip" = [ "aegisub.desktop" ];
        "text/x-ssa" = [ "aegisub.desktop" ];
        "text/x-ass" = [ "aegisub.desktop" ];
        "application/vnd.microsoft.portable-executable" = [ "ru.linux_gaming.PortProton.desktop" "protontricks-launch.desktop" ];
        "application/x-msdownload" = [ "ru.linux_gaming.PortProton.desktop" ];
        "text/plain" = [ "org.gnome.gedit.desktop" ];
      };
      defaultApplications = {
        "x-scheme-handler/http" = [ "zen-beta.desktop" ];
        "x-scheme-handler/https" = [ "zen-beta.desktop" ];
        "x-scheme-handler/chrome" = [ "zen-beta.desktop" ];
        "x-scheme-handler/discord" = [ "vesktop.desktop" ];
        "text/html" = [ "zen-beta.desktop" ];
        "application/x-extension-htm" = [ "zen-beta.desktop" ];
        "application/x-extension-html" = [ "zen-beta.desktop" ];
        "application/x-extension-shtml" = [ "zen-beta.desktop" ];
        "application/xhtml+xml" = [ "zen-beta.desktop" ];
        "application/x-extension-xhtml" = [ "zen-beta.desktop" ];
        "application/x-extension-xht" = [ "zen-beta.desktop" ];
        "application/x-subrip" = [ "aegisub.desktop" ];
        "text/x-ssa" = [ "aegisub.desktop" ];
        "text/x-ass" = [ "aegisub.desktop" ];
      };
    };
    portal = {
      enable = true;
      extraPortals = [pkgs.xdg-desktop-portal-hyprland];
      configPackages = [pkgs.hyprland];
    };
  };
}
