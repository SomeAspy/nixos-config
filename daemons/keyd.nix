{
  services.keyd = {
    enable = true;
    keyboards.default = {
      settings = {
        main = {
          # Capslock just seems like a minor annoyance. I can't remember the last time I intentionally used it. Maybe games?
          capslock = "noop";
          # literally the worst key ever
          # On my Thinkpad x1 carbon gen 9 these keys are mapped as such
          wlan = "noop"; # F8
          f21 = "noop"; # F9 - This key is supposed to open messaging according to the icon on the key but whatever. It disables the touchpad.
        };
      };
    };
  };
}
