# Thank you @h-banii!!!!
# They fixed all the module issues after I pr'ed an unrelated issue
{
  programs.pear-desktop = {
    enable = true;
    plugins = {
      disable-autoplay = {
        enable = true;
        applyOnce = true; # Only apply at startup
      };
      discord.enable = true;
      synced-lyrics.enable = true;
      scrobbler = {
        enable = true;
        scrobblers.lastfm.enable = true;
      };
    };
  };
}
