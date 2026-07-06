{
  services.flatpak = {
    enable = true;
    update.onActivation = true;
    # This seems to rely on networking
    # flatpak-managed-install[1709]: error: Unable to load summary from remote flathub: While fetching https://dl.flathub.org/repo/summary.idx: [6] Could not resolve hostname
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
