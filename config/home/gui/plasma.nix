{ pkgs, ... }:

{
  programs.plasma = {
    enable = true;
    workspace = {
      colorScheme = "BreezeDark";
      lookAndFeel = "org.kde.breezedark.desktop";
    };
    kwin.effects = {
      shakeCursor.enable = false;
      zoom.enable = false;
    };

    configFile = {
      "kwinrc"."ElectricBorders" = {
        TopLeft = "None";
      };
      "ksmserverrc" = {
        General = {
          loginMode = "startWithEmptySession";
        };
      };
    };
  };

  xdg.configFile."autostart/seafile-client.desktop".text = ''
    [Desktop Entry]
    Name=SeaFile
    Comment=Starts SeaFile process
    Exec=${pkgs.seafile-client}/bin/seafile-applet
    Type=Application
    Terminal=false
    NoDisplay=true
  '';

}
