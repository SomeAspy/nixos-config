{ pkgs, ... }:
let
  iniFormat = pkgs.formats.ini { };
  pcmanfmqtConfig = {
    Behavior = {
      # I hate seeing trash folders on removable media
      NoUsbTrash = true;
    };
    FolderView = {
      BigIconSize = 96;
    };
    System = {
      Terminal = "wezterm"; # TODO: Fix this, it just opens the terminal without opening the specific directory
    };
    Volume = {
      MountOnStartup = false;
      MountRemovable = false;
      AutoRun = false;
    };
  };
in
{
  home.packages = with pkgs; [
    pcmanfm-qt
    ffmpegthumbnailer
  ];
  xdg.configFile."pcmanfm-qt/default/settings.conf".source =
    iniFormat.generate "pcman-qt-settings.conf" pcmanfmqtConfig;
}
