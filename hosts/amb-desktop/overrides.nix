{
  hardware.graphics = {
    enable = true;
    # Allegedly, graphics just works.
  };
  nixpkgs.config.rocmSupport = true;
  home-manager.users."aiden" = {
    programs = {
      plasma = {
        powerdevil = {
          AC = {
            powerProfile = "performance";
          };
        };
      };
    };
  };
  programs.nixcord.discord.settings.enableHardwareAcceleration = false; # I don't know why this is an issue on my desktop specifically
}
