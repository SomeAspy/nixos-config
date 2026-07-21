{
  # Putting hostname here because it defines what the device is
  networking.hostName = "amb-laptop";

  boot = {
    initrd = {
      luks.devices."luks-ee5c4483-5db3-4727-a65f-35a3511c7dba" = {
        device = "/dev/disk/by-uuid/ee5c4483-5db3-4727-a65f-35a3511c7dba";
        allowDiscards = true;
        bypassWorkqueues = true;
      };
      availableKernelModules = [
        "xhci_pci"
        "thunderbolt"
        "nvme"
        "usb_storage"
        "sd_mod"
      ];
      kernelModules = [ "xe" ];

    };
    extraModulePackages = [ ];
    kernelModules = [ "kvm-intel" ];
    kernelParams = [
      # Fuck it, lets use Xe
      "i915.force_probe=!9a49"
      "xe.force_probe=9a49"
    ];
  };

  fileSystems = {
    "/" = {
      device = "/dev/mapper/luks-ee5c4483-5db3-4727-a65f-35a3511c7dba";
      fsType = "btrfs";
      options = [
        "noatime"
        "compress=zstd:1"
        "discard=async"
      ];
    };
    "/home" = {
      device = "/dev/mapper/luks-ee5c4483-5db3-4727-a65f-35a3511c7dba";
      fsType = "btrfs";
      options = [
        "subvol=home"
        "noatime"
        "compress=zstd:1"
        "discard=async"
      ];
    };
    "/nix" = {
      device = "/dev/mapper/luks-ee5c4483-5db3-4727-a65f-35a3511c7dba";
      fsType = "btrfs";
      options = [
        "subvol=nix"
        "noatime"
        "compress=zstd:1"
        "discard=async"
      ];
    };
    "/boot" = {
      device = "/dev/disk/by-uuid/F730-F43C";
      fsType = "vfat";
      options = [
        "fmask=0077"
        "dmask=0077"
        "noatime"
      ];
    };
  };

  nixpkgs.hostPlatform = "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = true
}
