{
  services.flatpak = {
    enable = true;
    # Having this enabled causes flatpak to attempt a network connection task at boot, which is stupid
    # update.onActivation = true;
    # Update instead on a daily task
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
}
