{ ... }:
{
  services.flatpak = {
    enable = true;
    update.onActivation = true;
    uninstallUnmanaged = true;
    packages = [
      "org.vinegarhq.Sober" # Life is roblox https://www.youtube.com/shorts/0uC0XiXNs0s
    ];
  };
}
