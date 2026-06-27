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
    ];
  };
  warnings = lib.optional (
    builtins.length config.nixpkgs.config.permittedInsecurePackages > 0
  ) "!!!! Insecure packages enabled !!!!";
}
