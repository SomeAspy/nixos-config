{ inputs, lib, ... }:

{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "old";
    sharedModules = lib.flatten [
      (lib.fileset.toList (lib.fileset.fileFilter (file: file.hasExt "nix") ./global))
      { home.stateVersion = "26.05"; }
    ];
    users = {
      "aiden" = {
        imports = lib.flatten [
          (lib.fileset.toList (lib.fileset.fileFilter (file: file.hasExt "nix") ./user))
          inputs.plasma-manager.homeModules.plasma-manager
          inputs.pear-desktop-nix.homeManagerModules.default
        ];

      };
      "root" = {
        # Force home manager to apply global programs to root
      };
    };

  };
}
