{ ... }:

{
  services.blocky = {
    enable = true;
    settings = {
      ports.dns = 54;

      upstreams.groups.default = [
        "https://one.one.one.one/dns-query" # Using Cloudflare's DNS over HTTPS server for resolving queries.
      ];

      bootstrapDns = {
        upstream = "https://one.one.one.one/dns-query";
        ips = [ "1.1.1.1" "1.0.0.1" ];
      };

      customDNS.mapping = {
        "watch.gonse.org" = "192.168.4.66";
        "gonse.org" = "192.168.4.66";
      };

      blocking = {
        denylists = {
          ads = [ "https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts" ];
        };
        clientGroupsBlock = {
          default = [ "ads" ];
        };
      };
    };
  };

  networking.nameservers = [ "127.0.0.1" "1.1.1.1" "8.8.8.8" ];

  networking.firewall.allowedTCPPorts = [ 54 ];
  networking.firewall.allowedUDPPorts = [ 54 ];
}
