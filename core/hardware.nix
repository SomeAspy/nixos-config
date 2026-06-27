{
  # virtslop
  virtualisation = {
    docker = {
      storageDriver = "btrfs";
      rootless = {
        enable = true;
        setSocketVariable = true;
      };
    };
    libvirtd.enable = true;
  };

  # TPM
  # https://wiki.nixos.org/wiki/Full_Disk_Encryption#Store_key_on_FIDO2_device_or_TPM
  security.tpm2 = {
    enable = true;
    pkcs11.enable = true;
    tctiEnvironment.enable = true;
  };

  # Bluetooth my beloved
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        FastConnectable = true;
      };
    };
  };
}
