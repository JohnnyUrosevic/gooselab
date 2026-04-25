{ ... }:

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
}
