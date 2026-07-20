{ lib, pkgs, ... }:
{
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    kernelModules = [ "tcp_bbr" ];
    kernel.sysctl = {
      # https://wiki.archlinux.org/title/Sysctl#Enable_BBR
      "net.ipv4.tcp_congestion_control" = "bbr";
      "net.core.default_qdisc" = "fq";
      # Tailscale wants this
      "net.ipv4.ip_forward" = 1;
      # https://wiki.archlinux.org/title/Sysctl#Enable_TCP_Fast_Open
      "net.ipv4.tcp_fastopen" = 3;
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

  zramSwap.enable = true;
}
