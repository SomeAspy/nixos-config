{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gram
    nixd # Nix LSP
    nixfmt
    vscode-json-languageserver
    package-version-server
  ];
}
