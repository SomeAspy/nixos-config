{ pkgs, lib, ... }:
{
  hardware.graphics = {
    enable = true;
    # Allegedly, graphics just works.
  };
  nixpkgs.config.rocmSupport = true;
  home-manager.users."aiden" = {
    programs = {
    nixcord.discord.settings.enableHardwareAcceleration = lib.mkForce false; # I don't know why this is an issue on my desktop specifically

      plasma = {
        powerdevil = {
          AC = {
            powerProfile = "performance";
          };
        };
      };
    };
    # Games for gaming desktop
    home.packages = with pkgs; [
      vintagestory
    ];
  };

}
