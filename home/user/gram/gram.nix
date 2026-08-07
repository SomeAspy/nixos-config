{
  config,
  pkgs,
  inputs,
  ...
}:
let
  gram-extensions = inputs.gram-extensions.packages.${pkgs.stdenv.hostPlatform.system};
  extensions = pkgs.callPackage ./extensions.nix { inherit (gram-extensions) buildGramExtension; };
in
{
  home.packages = with pkgs; [
    gram

    # Dependencies for extensions
    nixd
    nixfmt
    vscode-json-languageserver
    package-version-server
    lemminx
    yaml-language-server
  ];
  xdg.dataFile."gram/extensions/installed" = {
    enable = pkgs.stdenv.hostPlatform.isLinux;
    source = gram-extensions.linkGramExtensions extensions;
    onChange = ''
      cd "${config.xdg.dataHome}/gram/extensions"
      mv index.json index.json.backup
    '';
  };
  xdg.configFile."gram/settings.jsonc" = {
    # I don't want to manually fuck with the config file every time I want to make a tiny change
    # Not cursed at all
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos-config/home/user/gram/settings.jsonc";
  };
}
