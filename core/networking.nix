{
  networking = {
    # Hosts file
    hosts = {
      "0.0.0.0" = [
        "aistudio.google.com"
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

      # IPv6 shit
      "2606:4700:4700::1111#cloudflare-dns.com"
      "2606:4700:4700::1001#cloudflare-dns.com"
      "2001:4860:4860::8888#dns.google"
      "2001:4860:4860::8844#dns.google"
    ];

    # Let NM handle this stuff.
    useDHCP = false;
    dhcpcd.enable = false;

    networkmanager = {
      enable = true;
      dns = "systemd-resolved"; # Ignore DHCP provided DNS
      wifi.macAddress = "random"; # stable-ssid for per network
    };
  };

  services.resolved = {
    enable = true;
    settings = {
      Resolve = {
        DNSOverTLS = "opportunity"; # Work blocks DoH agony
        DNSSEC = "allow-downgrade"; # It is the year of our lord 2026 and some sites still don't have DNSSEC. (cough electron-vite.org)
        Domains = [ "~." ];
      };
    };
  };
}
