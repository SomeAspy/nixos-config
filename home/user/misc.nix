{
  pkgs,
  ...
}:

# USER / INSTALLED TO HOME ONLY

{
  home.packages = with pkgs; [
    syncplay
    seafile-client
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
    protontricks
    obs-studio

    # Development
    nodejs
    pnpm

  ];
  services = {
  };

}
