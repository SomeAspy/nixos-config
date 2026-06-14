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
    ];

    # Plasma 6 currently has non-optional packages that I think should be optional. Waiting for https://github.com/NixOS/nixpkgs/pull/529094 I guess
  };
}
