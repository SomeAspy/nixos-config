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
    configFile = {
      "plasmaparc"."General"."VolumeStep" = 1;
    };
  };

}
