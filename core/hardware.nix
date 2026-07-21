{ lib, ... }:
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
  # Don't start the service at boot, but leave the socket alive for activation when requested
  systemd.services.libvirtd.wantedBy = lib.mkForce [ ];

  # TPM
  # https://wiki.nixos.org/wiki/Full_Disk_Encryption#Store_key_on_FIDO2_device_or_TPM
  security.tpm2 = {
    enable = true;
    pkcs11.enable = true;
    tctiEnvironment.enable = true;
  };

  hardware = {
    # Firmware
    enableRedistributableFirmware = true;
    # Bluetooth my beloved
    bluetooth = {
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
  };
}
