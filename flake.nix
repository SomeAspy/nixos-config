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
    pear-desktop-nix = {
      url = "github:h-banii/pear-desktop-nix";
    };
    nix-flatpak = {
      url = "github:gmodena/nix-flatpak/?ref=latest";
    };
    nixcord.url = "github:FlameFlag/nixcord";
    lanzaboote = {
      url = "github:nix-community/lanzaboote";
      inputs.nixpkgs.follows = "nixpkgs";
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
            ./entry.nix
            ./hosts/${hostname}/configuration.overrides.nix
            ./hosts/${hostname}/hardware-configuration.nix
            ./hosts/${hostname}/home.overrides.nix
            inputs.home-manager.nixosModules.home-manager
            inputs.nix-flatpak.nixosModules.nix-flatpak
            inputs.lanzaboote.nixosModules.lanzaboote
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
