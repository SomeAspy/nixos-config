{ lib, pkgs, ... }:
{
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;

    # Networking optimizations - in boot.nix because this is modifying the kernel
    kernelModules = [ "tcp_bbr" ];
    kernel.sysctl = {
      "net.ipv4.tcp_congestion_control" = "bbr";
      "net.core.default_qdisc" = "fq";
      "net.core.rmem_max" = 4194304;
      "net.core.wmem_max" = 4194304;
      "net.core.somaxconn" = 4096;
    };
    loader = {
      systemd-boot.enable = lib.mkForce false; # Lanzaboote
      efi.canTouchEfiVariables = true;
    };
    lanzaboote = {
      enable = true;
      pkiBundle = "/var/lib/sbctl";
      autoGenerateKeys.enable = true;
      autoEnrollKeys = {
        includeMicrosoftKeys = false;
        allowBrickingMyMachine = true; # good luck bro
      };
      configurationLimit = 8;
      measuredBoot = {
        enable = true;
        pcrs = [
          # https://uapi-group.org/specifications/specs/linux_tpm_pcr_registry/
          0 # Firmware Integrity
          1 # Core Hardware Integrity
          2 # Additional Firmware Integrity
          3 # Additional Hardware Integrity
          4 # Bootloader Integrity
          7 # Secure Boot Integrity
        ];
      };
    };
  };

  # encrypted swap is disabled because it is literally broken https://github.com/nixos/nixpkgs/issues/524389
  zramSwap.enable = true;
}
