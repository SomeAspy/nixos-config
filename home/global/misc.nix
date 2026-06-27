{ pkgs, ... }:
{
  home.packages = with pkgs; [
    psmisc
    croc
    fastfetch
    wget
    whois
    tldr
    rustup
    gcc
    nerd-fonts.jetbrains-mono
    sbctl
    moor
  ];
}
