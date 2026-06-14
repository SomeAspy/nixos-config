{ pkgs, ... }:

{
  programs = {
    gamemode.enable = true;
    steam = {
      enable = true;
      localNetworkGameTransfers.openFirewall = true;
      gamescopeSession.enable = true;
      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];
    };
  };
}
