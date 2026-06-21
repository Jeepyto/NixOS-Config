{ ... }:
{
  networking.hostName = "nixos";

  networking.networkmanager.enable = true;

  services.dnsmasq = {
    enable = true;
    settings = {
      listen-address = "127.0.0.1";
      cache-size = 1000;
      no-resolv = true;
      server = [ "1.1.1.1" "8.8.8.8" "8.8.4.4" ];
    };
  };

  networking.networkmanager.dns = "dnsmasq";
}
