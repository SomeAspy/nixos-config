{ pkgs, ... }:
{
  # unlock kwallet at login
  security.pam.services.ly = {
    enableKwallet = true;
  };
  services.desktopManager.plasma6.enable = true;
  programs = {
    kde-pim.enable = false; # Literally never asked for this shit
    kdeconnect.enable = false;
  };
  environment = {
    plasma6.excludePackages = with pkgs.kdePackages; [
      discover # flatpak store gui
      ark # compression gui
      kate # IDE
      okular # Document viewer
      khelpcenter
      konsole
      qrca # QR maker/reader - I'm pretty sure the only place this is even used is for sharing wifi passwords
      elisa # Music player
      krdp # RDP is for losers
      dolphin
      gwenview
      plasma-browser-integration
      plasma-workspace-wallpapers
      # spectacle # Flameshot v14 STILL sucks
    ];

    # Plasma 6 currently has non-optional packages that I think should be optional. Waiting for https://github.com/NixOS/nixpkgs/pull/529094 I guess
  };
}
