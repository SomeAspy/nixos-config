{ pkgs, ... }:
{

  # Bro im fucking pissed off
  # apparently zed doesnt even have settings sync ?????? https://github.com/zed-industries/zed/discussions/6569#discussion-6129965
  # zed is fucking ai slop
  # gram doesn't have any nix config
  # and the fucking sync plugin someone made can't bootstrap when installed https://github.com/vittorius/zed-settings-sync/blob/3004a82fcf79437944c365e99e8598d507f503d1/README.md?plain=1#L40
  # gram solves a lot of these issues but why the hell is there a requirement to only allow local builds of extensions
  # sure sure own your shit and whatnot but holy fuck i just want to use a not-shit IDE
  # codium is looking better and better every day
  # I can't blame the nix maintainers of zed that gram doesn't work with it because gram is different in a lot of regards
  # But now that I also have my laptop going now my IDE experience can't be synced??
  # vscodium just worked. maybe thats where I belong
  # I hate electron so much though

  programs.zed-editor = {
    # This kinda fucking sucks
    enable = true;
    package = pkgs.gram;
    extensions = [
      # Gram requires local compilation, maybe this will do something idk
      # (surprise surprise it doesn't)
      "biome"
      "nix"
    ];
    extraPackages = with pkgs; [
      nixd # Nix LSP
      nixfmt
      vscode-json-languageserver
      package-version-server
      yaml-language-server
      bash-language-server
      vtsls # TypeScript LSP
      biome

      # just let me build my fucking extensions
      rustup
      stdenv
      pkg-config
      gcc

    ];

    # I think I'm shooting myself in the foot with this one, given these configs are probably a pain to do by hand.
    # Especially given the fact I can't install extensions declaritevly (see above)
    # And this is probably gonna be horrid too because home-manager makes the file read only...
    #
    # Nvm this doesn't even work because it places everything in ~/.config/zed

    userSettings = {
      autosave = "on_focus_change";
      scrollbar.git_diff = true;
      smooth_scroll.enabled = false;
      git_panel = {
        tree_view = true;
        collapse_untracked_diff = false;
        sort_by_path = false;
        status_style = "icon";
        dock = "left";
      };
      git = {
        blame.show_avatar = true;
        inline_blame.show_commit_summary = true;
      };
      languages = {
        Nix.language_servers = [ "nixd" ];
      };
      lsp = {
        nixd.binary.path = "/home/aiden/.nix-profile/bin/nixd";
      };
      use_system_path_prompts = true;
      buffer_line_height = "comfortable";
      buffer_font_family = "JetBrainsMono Nerd Font";
      text_rendering_mode = "platform_default";
      restore_on_startup = "last_session";
      redact_private_values = false;
      project_panel = {
        indent_guides.show = "always";
        entry_spacing = "standard";
        hide_gitignore = false; # insane default??? like, bro, i need to edit that sometimes???
        dock = "left"; # also gross default but eh
        file_icons = true;
        folder_icons = true;
      };
      icon_theme = "Material Icon Theme";
      ui_font_size = 14;
      buffer_font_size = "14.0";
      theme = "VSCode Dark Modern";
    };
  };
}
