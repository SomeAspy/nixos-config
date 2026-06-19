{ pkgs, ... }:
{
  programs.mpv = {
    enable = true;
    config = {
      hwdec = "auto"; # Default is Software rendering
      profile = "high-quality";
      ytdl-raw-options = "ignore-config=,embed-chapters=";
    };

    scripts = [
      pkgs.mpvScripts.thumbfast
    ];
  };
}
