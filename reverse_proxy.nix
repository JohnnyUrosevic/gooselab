{ ... }:

{
  networking.firewall.allowedTCPPorts = [ 80 443 ];

  services.caddy = {
    enable = true;
    virtualHosts."watch.gonse.org".extraConfig = ''
      reverse_proxy http://127.0.0.1:8096
    '';
  };
}
