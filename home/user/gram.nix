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
    ];
  };
}
