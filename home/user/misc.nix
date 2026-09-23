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
    kopuz
    discordchatexporter-cli
    d2
    onlyoffice-desktopeditors
    rendercv
    kicad
    kdePackages.kolourpaint
    dosbox-x

    # Development
    nodejs
    pnpm
    nixd
    clang-tools
    clang
    platformio
    wireviz
  ];
  programs ={
    direnv.enable = true;
  };
}
