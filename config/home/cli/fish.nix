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

    fish = {
      enable = true;
      shellAbbrs = {
        cat = "bat -pP";
        grep = "rg";
        ls = "eza";
        tree = "eza --tree";
      };

      interactiveShellInit = ''

        # trying to switch to KiTTY
        set fish_greeting "open tab = ctrl + shift + T
        close tab = ctrl + shift + Q
        switch tab = ctrl + tab"

        # RBW SSH agent
        if type -q rbw
          set -gx SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/rbw/ssh-agent-socket"
        end
      '';
    };
  };
}
