{ pkgs, ... }:
{
  home.packages = with pkgs; [
    psmisc
    nixfmt
    croc
    fastfetch
    wget
  ];
}
