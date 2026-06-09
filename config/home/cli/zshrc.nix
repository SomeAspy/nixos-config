{ ... }:

{
  programs = {
    bat.enable = true;
    eza.enable = true;
    ripgrep.enable = true;
    dircolors.enable = true;

    fzf = {
      enable = true;
      defaultOptions = [
        "--height 10%"
      ];
    };
    zsh = {
      enable = true;
      enableCompletion = true;
      history = {
        append = true;
        ignoreAllDups = true;
      };

      shellAliases = {
        cat = "bat -pP";
        grep = "rg";
        ls = "eza";
        tree = "eza --tree";
      };

      # antidote falls under programs.zsh
      antidote = {
        enable = true;
        plugins = [
          # https://github.com/zsh-users/zsh-completions
          "zsh-users/zsh-completions"
          # https://github.com/Aloxaf/fzf-tab
          "Aloxaf/fzf-tab"
          # https://github.com/joshskidmore/zsh-fzf-history-search
          "joshskidmore/zsh-fzf-history-search"
          # https://github.com/zsh-users/zsh-syntax-highlighting
          "zsh-users/zsh-syntax-highlighting"
        ];
      };
      initContent = ''
        PROMPT='%K{60}%B%F{254} %n@%m %b%F{60}%K{67}%F{255} %B%20<...<%~ %k%F{67}%f%k '

        # fzf-history-search keybinding
        bindkey '^[[A' fzf_history_search

        # Bitwarden SSH agent (rbw)
        if command -v rbw &>/dev/null; then
            export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/rbw/ssh-agent-socket"
        fi

      '';
    };
  };
}
