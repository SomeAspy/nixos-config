{
  buildGramExtension,
  fetchFromGitHub,
  ...
}:
# This is pretty ugly and I don't particularly care for keeping the extensions pure 100%
# I'd rather just keep them up to date
[
  (buildGramExtension (finalAttrs: {
    id = "vscode-dark-polished";
    version = "0.0.9";
    src = fetchFromGitHub {
      owner = "y7ya-com";
      repo = "vscode-dark-polished";
      rev = "master"; # repo doesn't have tags
      hash = "sha256-3imUBiLBpnyFbVpeliZiWz07oOwa9zCP9AKicw86X8s=";
    };
  }))
  (buildGramExtension (finalAttrs: {
    id = "material-icon-theme";
    version = "1.3.1";
    src = fetchFromGitHub {
      owner = "zed-extensions";
      repo = "material-icon-theme";
      tag = "v${finalAttrs.version}";
      hash = "sha256-NQDAQFV+iYpMfH+SYkHr7wN1ryf471SXx5rL/wdxhCs=";
    };
  }))
]
