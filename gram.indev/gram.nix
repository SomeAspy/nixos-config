{
  config,
  pkgs,
  inputs,
  ...
}: let
  system = pkgs.stdenv.hostPlatform.system;

  gram-extensions = inputs.gram-extensions.packages.${system};

  gramNix = pkgs.callPackage ./extensions/nix.ext {inherit (gram-extensions) buildGramExtension;};

  extensions = [
    gramNix
  ];

  extensions-dir = gram-extensions.linkGramExtensions extensions;
in {
  xdg.dataFile."gram/extensions/installed" = {
    enable = pkgs.stdenv.hostPlatform.isLinux;
    source = extensions-dir;
    onChange = ''
      cd "${config.xdg.dataHome}/gram/extensions"
      mv index.json index.json.backup
    '';
  };
}
