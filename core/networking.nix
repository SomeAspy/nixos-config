{

  # Maybe default DoH later idk
  networking = {
    # Hosts file
    hosts = {
      "0.0.0.0" = [
        # I need to break habits.
        "aistudio.google.com"
        "chatgpt.com"
        # "gemini.google.com"
      ];
    };

    nameservers = [
      # If both google and cloudfare are down you are fucked anyway
      "1.1.1.1"
      "1.0.0.1"
      "8.8.8.8"
      "8.8.4.4"
    ];
    networkmanager = {
      enable = true;
      dns = "none"; # Ignore DHCP provided DNS
    };
  };

}
