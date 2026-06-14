{ lib, ... }:

{
  imports = lib.fileset.toList (
    lib.fileset.intersection (lib.fileset.unions [
      ./modules
      ./daemons
      ./core
      ./home/manager.nix
    ]) (lib.fileset.fileFilter (file: file.hasExt "nix") ./.)
  );
}
