# This file should almost always be empty.
# Mainly used for temporary fixes like security overrides

{
  config,
  lib,
  ...
}:

{
  nixpkgs.config = {
    permittedInsecurePackages = [
      # See librewolf.nix
      "librewolf-bin-151.0.1-2"
      "librewolf-bin-unwrapped-151.0.1-2"
    ];
  };
  warnings = lib.optional (
    builtins.length config.nixpkgs.config.permittedInsecurePackages > 0
  ) "!!!! Insecure packages enabled !!!!";
}
