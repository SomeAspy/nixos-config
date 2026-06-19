{ pkgs, ... }:

# USER / INSTALLED TO HOME ONLY

{
  home.packages = with pkgs; [
    beeper
    syncplay
    seafile-client
    rbw # Root doesn't need access to my personal keys
    prismlauncher
    nomachine-client
    pinentry-qt
    qpwgraph
    nh
    syncplay
    yt-dlp
    wezterm

    # Development
    lazygit # I only used this like once but whatever
    nodejs
    pnpm
  ];
  services = {
  };
}
