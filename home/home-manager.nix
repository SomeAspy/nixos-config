{ lib, ... }:

{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "old";
    sharedModules = lib.flatten [
      (builtins.filter (lib.hasSuffix ".nix") (lib.fileset.toList ./global))
      { home.stateVersion = "26.05"; }
    ];
    # extraSpecialArgs = { inherit inputs; }; #unsure if needed
    users = {
      "aiden" = {
        imports = lib.flatten [
          (builtins.filter (lib.hasSuffix ".nix") (lib.fileset.toList ./user))
        ];

      };
      "root" = {
        # Force home manager to apply global programs to root
      };
    };

  };
}
