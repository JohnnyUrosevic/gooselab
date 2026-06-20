{
  ...
}:

{
  services.shelfmark = {
    enable = true;
    openFirewall = true;
    environment = {
      FLASK_HOST = "0.0.0.0";
    };
  };

  systemd.services.shelfmark = {
    serviceConfig = {
      ReadWritePaths = [
        "/mnt/data/downloads"
        "/mnt/data/books"
        "/mnt/data/audiobooks"
      ];
    };
  };

  services.kavita = {
    enable = true;
    tokenKeyFile = /run/secrets/kavita/tokenKey;
  };

  networking.firewall.allowedTCPPorts = [ 5000 ];
  networking.firewall.allowedUDPPorts = [ 5000 ];
}
