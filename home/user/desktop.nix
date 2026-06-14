{ ... }:
{
  programs = {
    rofi = {
      enable = true;
    };
    waybar = {
      enable = true;
      settings = {
        taskbar = {
          layer = "top";
          position = "top";
          height = 30;

          modules-right = [
            "mpris"
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

          mpris = {
            format = "{dynamic}";
          };

        };
      };
    };
  };
  home = {
    file = {
      ".config/labwc/autostart".source = ./static/labwc/autostart;
      ".config/labwc/environment".source = ./static/labwc/environment;
    };
  };
}
