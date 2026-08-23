{ pkgs, ... }:
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
    # Games for gaming desktop
    home.packages = with pkgs; [
      vintagestory
    ];
  };

}
