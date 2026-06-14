{ ... }: {
  services.tailscale = {
    enable = true;
    extraSetFlags = [
      "--operator=aiden"
      "--accept-dns=true"
      "--accept-routes=true"
      "--shields-up=true"
    ];
  };
}
