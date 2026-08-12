{ config, pkgs, ... }:
{
  programs.zed-editor = {
    enable = true;
    defaultEditor = true;
    extensions = [
      "nix"
      "d2"
    ];
    extraPackages = with pkgs; [
      nixd
      clang-tools
      clang
      platformio
    ];
  };
  xdg.configFile."zed/settings.json" = {
  # I don't want to manually fuck with the config file every time I want to make a tiny change
  # Not cursed at all
  source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos-config/home/user/zed-editor/settings.jsonc";
  };
}
