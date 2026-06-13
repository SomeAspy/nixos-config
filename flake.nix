{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };
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
            ./config/default.nix
            ./config/hosts/${hostname}/configuration.overrides.nix
            ./config/hosts/${hostname}/hardware-configuration.nix
            ./config/hosts/${hostname}/home.overrides.nix
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
