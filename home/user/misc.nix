{ pkgs, ... }:

# USER / INSTALLED TO HOME ONLY

{
  home.packages = with pkgs; [
    (discord.override {
      withEquicord = true;
      withOpenASAR = true;
      withTTS = false;
    })
    thunderbird
    beeper
    syncplay
    seafile-client
    rbw # Root doesn't need access to my personal keys
    prismlauncher
    nomachine-client
    kitty
    pinentry-qt
    qpwgraph
    nh
    syncplay
    yt-dlp

    # Development
    lazygit # I only used this like once but whatever
    nodejs
    pnpm
  ];
  services = {
  };
}
