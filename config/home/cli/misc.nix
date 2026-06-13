{ pkgs, ... }:
{
  home.packages = with pkgs; [
    psmisc
    nixfmt
    croc
    fastfetch
    pinentry-qt
    wget
    lazygit
  ];
}
