{
  services = {
    printing.enable = true; # I use this like once in a blue moon, but every time I do I'm in a rush and don't want to deal with nix
    fwupd.enable = true; # putting in global even though firmware capsules on desktop is basically non-existent, heres to hoping
    fstrim.enable = true; # Fallback, used for /boot too I guess

    # For pcmanfm-qt
    gvfs.enable = true;
    udisks2.enable = true;
  };
}
