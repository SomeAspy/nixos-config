{ pkgs, ... }:

{
  programs = {
    gamemode.enable = true;
    steam = {
      enable = true;
      localNetworkGameTransfers.openFirewall = true; # Realistically I don't use this
      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];
    };
  };
}
