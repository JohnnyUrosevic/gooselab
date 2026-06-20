{ ... }:

{
  networking.firewall.allowedTCPPorts = [ 80 443 ];

  services.caddy = {
    enable = true;
    virtualHosts."watch.gonse.org".extraConfig = ''
      reverse_proxy http://127.0.0.1:8096
    '';

    virtualHosts."request.gonse.org".extraConfig = ''
      reverse_proxy http://127.0.0.1:5055
    '';

    virtualHosts."cloud.gonse.org".extraConfig = ''
      reverse_proxy http://127.0.0.1:8009
    '';

    virtualHosts."read.gonse.org".extraConfig = ''
      reverse_proxy http://127.0.0.1:5000
    '';
  };
}
