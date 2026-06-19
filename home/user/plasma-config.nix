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
    session.sessionRestore.restoreOpenApplicationsOnLogin = "startWithEmptySession";
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

    # This isn't working
    configFile = {
      "kwinrc"."ElectricBorders" = {
        TopLeft = "None";
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
    NoDisplay=false
  '';

  xdg.configFile."autostart/beeper.desktop".text = ''
    [Desktop Entry]
    Name=Beeper
    Comment=Starts Beeper process
    Exec=${pkgs.beeper}/bin/beeper --hidden
    Type=Application
    Terminal=false
    NoDisplay=false
  '';

  xdg.configFile."autostart/thunderbird.desktop".text = ''
    [Desktop Entry]
    Name=Thunderbird
    Comment=Starts Thunderbird process
    Exec=${pkgs.thunderbird}/bin/thunderbird
    Type=Application
    Terminal=false
    NoDisplay=false
  '';

}
