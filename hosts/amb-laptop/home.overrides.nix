{
  home-manager.users."aiden" = {
    programs = {
      plasma = {
        input.touchpads = [
          {
            # ThinkPad X1 Carbon Gen 9
            name = "SYNA8008:00 06CB:CE58 Touchpad";
            vendorId = "06cb";
            productId = "ce58";
            naturalScroll = true;
            tapToClick = false;
            rightClickMethod = "twoFingers";
          }
        ];
        powerdevil = {
          AC = {
            powerProfile = "balanced";
          };
        };
      };
    };
  };
}
