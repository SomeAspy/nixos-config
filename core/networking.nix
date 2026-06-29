{

  # Maybe default DoT later idk
  networking = {
    # Hosts file
    hosts = {
      "0.0.0.0" = [
        # I need to break habits.
        #"aistudio.google.com"
        "chatgpt.com"
        #"gemini.google.com"
      ];
    };

    nameservers = [
      # If both google and cloudfare are down you are fucked anyway
      "1.1.1.1#cloudflare-dns.com"
      "1.0.0.1#cloudflare-dns.com"
      "8.8.8.8#dns.google"
      "8.8.4.4#dns.google"
    ];

    # Let NM handle this stuff.
    useDHCP = false;
    dhcpcd.enable = false;

    networkmanager = {
      enable = true;
      dns = "systemd-resolved"; # Ignore DHCP provided DNS
    };
  };
  boot.kernel.sysctl = {
    # Tailscale wants this
    "net.ipv4.ip_forward" = 1;
  };

  services.resolved = {
    enable = true;
    settings = {
      Resolve = {
        DNSOverTLS = true;
        DNSSEC = true;
        Domains = ["~."];
        FallbackDNS = [
          "1.1.1.1#cloudflare-dns.com"
          "1.0.0.1#cloudflare-dns.com"
        ];
      };
    };
  };
}
