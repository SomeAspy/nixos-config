{ pkgs, ... }:
{

  programs.zed-editor = {
    # This kinda fucking sucks
    enable = true;
    package = pkgs.gram;
    extraPackages = with pkgs; [
      nixd # Nix LSP
      nixfmt
      vscode-json-languageserver
      package-version-server
      yaml-language-server
      bash-language-server
      vtsls # TypeScript LSP

      # just let me build my fucking extensions
      rustup
      stdenv
      pkg-config
      gcc

    ];
  };
}
