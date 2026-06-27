{ pkgs, ... }: {
  users.users."aiden" = {
    isNormalUser = true;
    description = "Aiden";
    shell = pkgs.fish;
    extraGroups = [
      "networkmanager"
      "wheel"
      "tss" # TPM
    ];
  };
}
