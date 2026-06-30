{ pkgs, ... }:
{
  # unlock kwallet at login
  security.pam.services.ly = {
    enableKwallet = true;
  };
  services.desktopManager.plasma6.enable = true;
  environment = {
    plasma6.excludePackages = with pkgs.kdePackages; [
      discover
      ark
      kate
      okular
      khelpcenter
      konsole
      qrca
      elisa
      krdp
      dolphin
      gwenview
      plasma-browser-integration
      kwin-x11
      plasma-workspace-wallpapers

      # spectacle # Flameshot v14 STILL sucks
    ];

    # Plasma 6 currently has non-optional packages that I think should be optional. Waiting for https://github.com/NixOS/nixpkgs/pull/529094 I guess
  };
}
