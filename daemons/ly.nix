{
  services.displayManager.ly = {
    enable = true;
    x11Support = false;
    settings = {
      bigclock = "en";
      session_log = null; # Ly defaults to .local/state/ly-session.log but it seems to be getting placed in ~/
      show_tty = true;
    };
  };
}
