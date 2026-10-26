{ pkgs, ... }:

{
  home.packages = with pkgs; [
    syncplay
    rbw # Root doesn't need access to my personal keys
    prismlauncher
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
    d2
    onlyoffice-desktopeditors
    rendercv
    kicad
    kdePackages.kolourpaint

    # Development
    nodejs
    pnpm
    nixd
    clang-tools
    clang
    platformio
  ];
  programs ={
    direnv.enable = true;
  };
}
