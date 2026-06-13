{ pkgs, ... }:
{
  programs = {
    anyrun = {
      enable = true;
      config = {
        closeOnClick = true;
        hideIcons = false;
        layer = "overlay";
        showResultsImmediately = true;
        plugins = [
          "${pkgs.anyrun}/lib/libapplications.so"
          "${pkgs.anyrun}/lib/librink.so"
          "${pkgs.anyrun}/lib/libshell.so"
          "${pkgs.anyrun}/lib/libdictionary.so"
          "${pkgs.anyrun}/lib/libwebsearch.so"
          "${pkgs.anyrun}/lib/libnix_run.so"
        ];
      };
    };
    waybar = {
      enable = true;
      settings = {
        taskbar = {
          layer = "top";
          position = "top";
          height = 30;

          modules-right = [
            "tray"
            "clock"
          ];
          modules-left = [
            "wlr/taskbar"
          ];
          "wlr/taskbar" = {
            format = "{icon}";
            on-click = "activate";
            all-outputs = true;
          };

        };
      };
    };
  };
  home = {
    file = {
      ".config/labwc/rc.xml".source = ./static/labwc/rc.xml;
      ".config/labwc/autostart".source = ./static/labwc/autostart;
      ".config/labwc/environment".source = ./static/labwc/environment;
    };
  };
}
