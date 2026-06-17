{
  programs.git = {
    enable = true;
    settings = {
      init.defaultBranch = "main";
      user = {
        name = "SomeAspy";
        email = "amb@aspy.dev";
        signingkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPYg5Nj07ysQzSUL4bc18wO7WvkbtZua7pNPyy/f5A1M";
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
