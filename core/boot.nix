{ pkgs, ... }:
{
  boot = {
    kernelPackages = pkgs.linuxPackages_xanmod_latest; # This might be insane

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
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  # encrypted swap is disabled because it is literally broken https://github.com/nixos/nixpkgs/issues/524389
  zramSwap.enable = true;
}
