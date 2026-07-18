{
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
}
