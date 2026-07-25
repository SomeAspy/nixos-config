{
  programs = {
    fish.enable = true;
    nix-ld.enable = true; # Compile programs that assume the standard FHS properly
    virt-manager.enable = true;
    git.enable = true; # Install git globally, but user confs are applied in standard fashion
  };

}
