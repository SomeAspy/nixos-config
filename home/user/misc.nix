{ pkgs, ... }:

# USER / INSTALLED TO HOME ONLY

{
  home.packages = with pkgs; [
    (discord.override {
      withEquicord = true;
      withOpenASAR = true;
      withTTS = false;
    })
    vscodium
    thunderbird
    beeper
    syncplay
    seafile-client
    rbw # Root doesn't need access to my personal keys
    prismlauncher
    pear-desktop
    nomachine-client
    mpv
    librewolf
    kitty
    nodejs
    pnpm
    mpv
    grim
    slurp
    satty
    wl-clipboard
    lazygit
    pinentry-qt
  ];

  services = {
    playerctld.enable = true;
    mpris-proxy.enable = true;
  };
}
