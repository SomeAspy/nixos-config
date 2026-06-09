{ lib, inputs, ... }:

{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "old";
    sharedModules = lib.flatten [
      (builtins.filter (lib.hasSuffix ".nix") (lib.fileset.toList ./cli))
      { home.stateVersion = "26.05"; }
    ];
    # extraSpecialArgs = { inherit inputs; }; #unsure if needed
    users = {
      "aiden" = {
        imports = lib.flatten [
          (builtins.filter (lib.hasSuffix ".nix") (lib.fileset.toList ./gui))
          inputs.plasma-manager.homeModules.plasma-manager
        ];

      };
      "root" = {
        # Force home manager to apply CLI programs to root
      };
    };

  };
}
