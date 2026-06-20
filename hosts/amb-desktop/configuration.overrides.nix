{
  networking.hostName = "amb-desktop";
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
    initrd.luks.devices."luks-976096ee-657c-4b9b-b892-52836fc05a1d".allowDiscards = true;
    kernelParams = [ "amd_pstate=active" ];
  };
  nixpkgs.config.rocmSupport = true;
  services.fstrim.enable = true;
}
