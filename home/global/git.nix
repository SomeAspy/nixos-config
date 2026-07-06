{
  programs.git = {
    enable = true;
    settings = {
      init.defaultBranch = "main";
      user = {
        name = "SomeAspy";
        email = "amb@aspy.dev";
        # This might cause issues because the keys are stored in rbw and root doesn't have access to rbw
        # Unsure how I plan to go about this at the moment. Also brings the concern of using qt-pinentry in root cli
        signingkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPYg5Nj07ysQzSUL4bc18wO7WvkbtZua7pNPyy/f5A1M";
      };
      url = {
        "ssh://git@github.com" = {
          insteadOf = "https://github.com";
        };
        "ssh://git@codeberg.org" = {
          insteadOf = "https://codeberg.org";
        };
      };
      gpg = {
        format = "ssh";
      };
      commit = {
        gpgsign = true;
      };
    };
  };
}
