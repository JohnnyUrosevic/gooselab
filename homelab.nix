{ pkgs, ... }:

{
  services.radarr = {
    enable = true;
    openFirewall = true;
    user = "goose";
  };

  services.sonarr = {
    enable = true;
    openFirewall = true;
    user = "goose";
  };

  services.bazarr = {
    enable = true;
    openFirewall = true;
    user = "goose";
  };

  services.prowlarr = {
    enable = true;
    openFirewall = true;
  };

  # services.qbittorrent = {
  #   enable = true;
  #   openFirewall = true;
  # };

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

  services.jellyfin = {
    enable = true;
    openFirewall = true;
    user = "goose";
  };
  environment.systemPackages = [
    pkgs.jellyfin
    pkgs.jellyfin-web
    pkgs.jellyfin-ffmpeg
  ];

  services.jellyseerr = {
    enable = true;
    openFirewall = true;
  };

}
