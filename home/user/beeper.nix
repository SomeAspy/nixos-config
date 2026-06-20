{ config, pkgs, ... }:
{
  home = {
    packages = [ pkgs.beeper ];
    file."${config.xdg.configHome}/BeeperTexts/config.json" = {
      force = true;
      text = builtins.toJSON {
        auto_update_disabled = true;
        desktop_api_disabled = true; # Disable beepers MCP agent server
      };
    };

  };
}
