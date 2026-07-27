{ pkgs, osConfig, ... }:

let
  iniFormat = pkgs.formats.ini { };
  seafileClientConfig = {
    Behavior.hideMainWindowWhenStarted = true;
    Settings.computerName = osConfig.networking.hostName;
    UsedServerAddresses.main = "https://files.aspy.dev";
  };

in
{
  home.packages = with pkgs; [
    seafile-client
  ];
  xdg.configFile."Seafile/Seafile Client.conf".source =
    iniFormat.generate "seafile-client" seafileClientConfig;
}
