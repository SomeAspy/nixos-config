{ pkgs, ... }:
{
  xdg.configFile."autostart/seafile-client.desktop".text = ''
    [Desktop Entry]
    Name=SeaFile
    Comment=Starts SeaFile process
    Exec=${pkgs.seafile-client}/bin/seafile-applet
    Type=Application
    Terminal=false
    NoDisplay=true
  '';

  xdg.configFile."autostart/beeper.desktop".text = ''
    [Desktop Entry]
    Name=Beeper
    Comment=Starts Beeper process
    Exec=${pkgs.beeper}/bin/beeper
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
