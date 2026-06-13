{ pkgs, ... }:

# GUI / INSTALLED TO HOME ONLY

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
  ];
}
