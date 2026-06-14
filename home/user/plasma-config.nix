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

    # I'm pretty sure this is literally broken
    # https://github.com/nix-community/plasma-manager/discussions/553
    # https://invent.kde.org/documentation/develop-kde-org/-/work_items/235
    panels = [
      {
        widgets = [
          "org.kde.plasma.kickoff"
          "org.kde.plasma.icontasks"
          "org.kde.plasma.mediacontroller"
          "org.kde.plasma.systemtray"
          "org.kde.plasma.digitalclock"
        ];

      }
    ];

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
