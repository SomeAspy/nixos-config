{ pkgs, ... }:
{
  services.displayManager.ly.enable = true;
  services.desktopManager.plasma6.enable = true;
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    # kwalletmanager, kinfocenter and plasma-monitor cannot be removed
    discover
    ark
    elisa
    kate
    khelpcenter
    okular
    qrca
    plasma-browser-integration
  ];
}
