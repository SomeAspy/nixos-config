{
  # Putting hostname here because it defines what the device is
  networking.hostName = "amb-desktop";

  boot = {
    initrd = {
      luks.devices."luks-976096ee-657c-4b9b-b892-52836fc05a1d" = {
        device = "/dev/disk/by-uuid/976096ee-657c-4b9b-b892-52836fc05a1d";
        allowDiscards = true;
        bypassWorkqueues = true;
      };
      availableKernelModules = [
        "nvme"
        "xhci_pci"
        "ahci"
        "usbhid"
      ];
      kernelModules = [ "amdgpu" ];
    };
    kernelModules = [ "kvm-amd" ];
    extraModulePackages = [ ];
    kernelParams = [ "amd_pstate=active" ];
  };

  fileSystems = {
    "/" = {
      device = "/dev/mapper/luks-976096ee-657c-4b9b-b892-52836fc05a1d";
      fsType = "btrfs";
      options = [
        "noatime"
        "compress=zstd:1"
        "discard=async"
      ];
    };
    "/home" = {
      device = "/dev/mapper/luks-976096ee-657c-4b9b-b892-52836fc05a1d";
      fsType = "btrfs";
      options = [
        "subvol=home"
        "noatime"
        "compress=zstd:1"
        "discard=async"
      ];
    };
    "/nix" = {
      device = "/dev/mapper/luks-976096ee-657c-4b9b-b892-52836fc05a1d";
      fsType = "btrfs";
      options = [
        "subvol=nix"
        "noatime"
        "compress=zstd:1"
        "discard=async"
      ];
    };
    "/boot" = {
      device = "/dev/disk/by-uuid/EF0D-7228";
      fsType = "vfat";
      options = [
        "fmask=0077"
        "dmask=0077"
        "noatime"
      ];
    };
  };

  nixpkgs.hostPlatform = "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = true
}
