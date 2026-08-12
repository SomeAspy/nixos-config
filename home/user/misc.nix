{ pkgs, ... }:

{
  home.packages = with pkgs; [
    syncplay
    rbw # Root doesn't need access to my personal keys
    prismlauncher
    #nomachine-client #https://github.com/NixOS/nixpkgs/issues/550535
    pinentry-qt
    yt-dlp
    wezterm
    qalculate-qt
    qimgv
    btop
    r2modman
    obs-studio
    audacity
    kopuz
    discordchatexporter-cli
    d2
    onlyoffice-desktopeditors
    rendercv
    kicad

    # Development
    nodejs
    pnpm

  ];
}
