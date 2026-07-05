{ pkgs, ... }:

{
  programs = {
    gamemode.enable = true;
    steam = {
      enable = true;
      protontricks.enable = true;
      remotePlay.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true; # Realistically I don't use this
      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];
    };
  };
}
