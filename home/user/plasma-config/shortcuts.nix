{
  programs.plasma = {
    shortcuts = {
      "org_kde_powerdevil" = {
        "powerProfile" = [ ];
      };
    };
    hotkeys.commands = {
      screenshot = {
        name = "Launch Flameshot";
        key = "Print";
        command = "flameshot gui";
      };
    };
  };
}
