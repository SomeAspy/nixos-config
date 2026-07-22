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
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest"; # This takes no input for nixpkgs
    nixcord = {
      url = "github:4evy/nixcord";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    lanzaboote = {
      url = "github:nix-community/lanzaboote";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    gram-extensions = {
      url = "git+http://codeberg.org/niklaskorz/nix-gram-extensions"; # HTTP to dodge git changing https:// to ssh:// - its redirected to https anyway
      # inputs.nixpkgs.follows = "nixpkgs"; #Horror
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
            ./hosts/${hostname}/hardware.nix
            ./hosts/${hostname}/overrides.nix
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
