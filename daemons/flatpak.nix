{
  services.flatpak = {
    enable = true;
    # Having this enabled causes flatpak to attempt a network connection task at boot, which is stupid
    # update.onActivation = true;
    # Update instead on a daily task (This doesn't entirely fix the issue consistently, see unitConfig near bottom)
    update.auto = {
      enable = true;
      onCalendar = "daily";
    };
    uninstallUnmanaged = true;
    packages = [
      "org.vinegarhq.Sober" # Life is roblox https://www.youtube.com/shorts/0uC0XiXNs0s
    ];
    remotes = [
      {
        name = "flathub";
        location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
      }
    ];
  };
  # Stop trying to update prior to network connection. This should be default behavior...
  systemd.services."flatpak-managed-install".unitConfig = {
    After = [ "network-online.target" ];
    Wants = [ "network-online.target" ];
  };
}
