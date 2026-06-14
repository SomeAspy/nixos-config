{ lib, pkgs, ... }:

{
  imports = lib.flatten [
    ./home/home-manager.nix
    (builtins.filter (lib.hasSuffix ".nix") (
      lib.fileset.toList (lib.fileset.union ./modules ./root-services)
    ))
  ];

  nix.settings = {
    substituters = [
      "https://cache.nixos.org"
      "https://nix-community.cachix.org"
    ];
    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  # Bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        FastConnectable = true;
      };
    };
  };

  # TPM
  security.tpm2.enable = true;
  security.tpm2.pkcs11.enable = true;
  security.tpm2.tctiEnvironment.enable = true;

  # Bootloader
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Networking
  # Maybe default DoH later idk
  networking = {
    nameservers = [
      # If both google and cloudfare are down you are fucked anyway
      "1.1.1.1"
      "8.8.8.8"
    ];
    networkmanager = {
      enable = true;
      dns = "none"; # Ignore  DHCP provided DNS
    };
  };

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  time.timeZone = "America/New_York";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_GB.UTF-8"; # 24 hour time
  };

  # Enable Flakes
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # For xremap
  hardware.uinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."aiden" = {
    isNormalUser = true;
    description = "Aiden";
    shell = pkgs.fish;
    extraGroups = [
      "networkmanager"
      "wheel"
      "uinput"
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # This should never change
  system.stateVersion = "26.05";
}
