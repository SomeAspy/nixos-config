{ ... }:

{
  services.xremap = {
    enable = true;
    withWlroots = true;
    config = {
      keymap = [
        {
          name = "Shortcuts";
          remap = {
            "Super-Enter" = {
              launch = [ "rofi" ];

            };
            "Print" = {
              launch = [
                "sh"
                "-c"
                "grim -g \"$(slurp -d)\" - | wl-copy"
              ];
            };
          };
        }
      ];
    };
  };
}
