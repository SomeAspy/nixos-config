{ pkgs, ... }:

{
  home.packages = with pkgs; [
    syncplay
    rbw # Root doesn't need access to my personal keys
    prismlauncher
    nomachine-client
    pinentry-qt
    yt-dlp
    wezterm
    qalculate-qt
    qimgv
    btop
    r2modman
    obs-studio
    audacity
    discordchatexporter-cli

    # Development
    nodejs
    pnpm

  ];
}
