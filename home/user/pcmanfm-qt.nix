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
      Terminal = "wezterm";
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
