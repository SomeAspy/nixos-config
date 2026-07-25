{ inputs, lib, ... }:

{
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "old";
    sharedModules = lib.flatten [
      (lib.fileset.toList (lib.fileset.fileFilter (file: file.hasExt "nix") ./global))
      {
        home.stateVersion = "26.05";
        xdg.enable = true; # populates XDG variable names
      }
    ];
    users = {
      "aiden" = {
        imports = lib.flatten [
          (lib.fileset.toList (
            lib.fileset.difference (lib.fileset.fileFilter (
              file: file.hasExt "nix"
            ) ./user) ./user/gram/extensions.nix # Exclude this because its only for gram-extensions to interpret
          ))
          inputs.plasma-manager.homeModules.plasma-manager
          inputs.pear-desktop-nix.homeManagerModules.default
          inputs.nixcord.homeModules.nixcord
        ];

      };
      "root" = {
        # Force home manager to apply global programs to root
      };
    };

  };
}
