{ config, ... }:

{
  services.nextcloud = {
    enable = true;
    hostName = "localhost";
    config.adminpassFile = "/run/secrets/nextcloud/password";
    config.dbtype = "pgsql";
  };

  services.nginx.virtualHosts."${config.services.nextcloud.hostName}".listen = [ { addr = "127.0.0.1"; port = 4201; } ];
}
