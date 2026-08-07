{
  buildGramExtension,
  fetchFromGitHub,
  ...
}:
# This is pretty ugly and I don't particularly care for keeping the extensions pure 100%
# I'd rather just keep them up to date
[
  # https://github.com/y7ya-com/vscode-dark-polished
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
  # https://github.com/zed-extensions/material-icon-theme
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
  # make this work later, I have other things to do
  # https://github.com/gabeins/zed-d2
  # (buildGramExtension (finalAttrs: {
  #   id = "d2";
  #   version = "0.2.1";
  #   src = fetchFromGitHub {
  #     owner = "gabeins";
  #     repo = "zed-d2";
  #     tag = "${finalAttrs.version}"; # maintainer doesn't put v
  #     hash = "sha256-xlbf9VLTa8pdYIm4T1BbJDFmQ8bTK4MQI1CMv8vTs5k=";
  #   };
  #   grammars = {
  #     d2 = fetchFromGitHub {
  #       owner = "ravsii";
  #       repo = "tree-sitter-d2";
  #       tag = "v0.7.2";
  #       hash = "sha256-zx6ud3uh+0Z+cYdP2KkFA27Kb6fW/CSGpC1C4YmCIo0=";
  #     };
  #   };
  # }))
]
