{
  nix = {
    settings = {

      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      substituters = [
        "https://cache.nixos.org"
        "https://nix-community.cachix.org"
      ];
      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
    };
  };
  nixpkgs.config = {
    allowUnfree = true;
    # This will cause a violent rebuild, allegedly
    # Ok yeah it will cause nix to build basically everything from source.
    # Don't enable it unless you want to have a bad time
    # Possible alias: Gentoo mode
    enableParallelBuildingByDefault = false; # Not sure if this is doing what I think it does - I'd expect it to simply allow building multiple packages at a time
  };
  environment.sessionVariables.NIXOS_OZONE_WL = "1"; # I hate electron so much

  # This should never change
  system.stateVersion = "26.05";
}
