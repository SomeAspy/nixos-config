{pkgs,...}:
{
  services.envfs.enable = true;
  programs.nix-ld = {
    enable = true; # Compile programs that assume the standard FHS properly
    libraries = with pkgs; [
      ncurses5
      elfutils
    ];
  };

}
