{
  home-manager.users."aiden" = {
    programs.plasma = {
      powerdevil = {
        AC = {
          powerProfile = "performance";
        };
      };
      configFile = {
        "plasmaparc"."General"."VolumeStep" = 1;
      };
    };
  };
}
