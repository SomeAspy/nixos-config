{
  networking = {
    # Hosts file
    hosts = {
      "0.0.0.0" = [
        # I need to break habits.
        # Note to future self:
        # If you uncomment this shit again you are a FUCKING DISAPPOINTMENT and a FUCKING FRAUD and you KNOW IT
        "aistudio.google.com"
        "chatgpt.com"
        "gemini.google.com"
      ];
    };

    nftables = {
      # Just networking.firewall uses iptables
      enable = true;
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

  services.resolved = {
    enable = true;
    settings = {
      Resolve = {
        DNSOverTLS = true;
        DNSSEC = "allow-downgrade"; # It is the year of our lord 2026 and some sites still don't have DNSSEC. (cough electron-vite.org)
        Domains = [ "~." ];
      };
    };
  };
}
