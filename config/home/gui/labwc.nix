{ pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      sfwbar
    ];
    file = {
      "./labwc/rc.xml".source = ./labwc/rc.xml;
      "./labwc/autostart".source = ./labwc/autostart;
      "./labwc/environment".source = ./labwc/environment;
    };
  };
  xdg.configFile."sfwbar/sfwbar.config" = {
    source = ./w10.config;
  };
}
