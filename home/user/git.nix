{
  programs.git = {
    enable = true; # See modules/misc.nix
    settings = {
      init.defaultBranch = "main";
      user = {
        name = "SomeAspy";
        email = "amb@aspy.dev";
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
