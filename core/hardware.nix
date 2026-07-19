{
  # virtslop
  virtualisation = {
    podman = {
      enable = true;
      autoPrune.enable = true;
      dockerCompat = true; # Just aliases commands
    };
    libvirtd = {
      enable = true;
      onBoot = "ignore"; # This isn't the actual service, this refers to the VMs
    };
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
        # Whats the worst that could happen
        KernelExperimental = true;
        Experimental = true;
      };
    };
  };
}
