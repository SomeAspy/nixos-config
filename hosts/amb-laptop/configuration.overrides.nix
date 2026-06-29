{
  networking.hostName = "amb-laptop";
  fileSystems = {
    "/".options = [
      "noatime"
      "compress=zstd:1"
      "discard=async"
    ];
    "/nix".options = [
      "noatime"
      "compress=zstd:1"
      "discard=async"
    ];
    "/home".options = [
      "noatime"
      "compress=zstd:1"
      "discard=async"
    ];
  };
  boot = {
    initrd.luks.devices."luks-ee5c4483-5db3-4727-a65f-35a3511c7dba".allowDiscards = true;
  };
  services.fstrim.enable = true;
}
