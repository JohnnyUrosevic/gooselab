{ config, ... }:

{
  services.radarr = {
    enable = true;
    openFirewall = true;
  };

  services.prowlarr = {
    enable = true;
    openFirewall = true;
  };

  services.qbittorrent = {
    enable = true;
    openFirewall = true;
  };

  services.openvpn.servers = {
    pia = {
      config = ''
        config /home/goose/gooselab/config.ovpn
        auth-user-pass /etc/nixos/pia-auth.txt
      '';
      autoStart = true;
      updateResolvConf = true; # DNS resolution, probably remove later
    };
  };
}
