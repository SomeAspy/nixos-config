{ pkgs, ... }:
{
  home.packages = with pkgs; [
    psmisc
    croc
    fastfetch
    wget
    whois
    tldr
    nerd-fonts.jetbrains-mono
    sbctl
    moor
    unzip
    zip
    python3
  ];
}
