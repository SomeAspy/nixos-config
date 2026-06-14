{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    xremap-flake.url = "github:xremap/nix-flake";
  };
  outputs =
    inputs:
    let
      addHost =
        hostname:
        inputs.nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            ./base.nix
            ./hosts/${hostname}/configuration.overrides.nix
            ./hosts/${hostname}/hardware-configuration.nix
            ./hosts/${hostname}/home.overrides.nix
            inputs.home-manager.nixosModules.home-manager
          ];
        };

    in
    {
      nixosConfigurations = {
        amb-desktop = addHost "amb-desktop";
        amb-laptop = addHost "amb-laptop";
      };
    };
}
