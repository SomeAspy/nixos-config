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
    nh
    syncplay
    yt-dlp
    wezterm
    kdePackages.kcalc
    kdePackages.gwenview
    btop

    # Development
    lazygit # I only used this like once but whatever
    nodejs
    pnpm

  ];
  services = {
  };

}
