{ pkgs, ... }:

{
  imports = [
    ./downloads.nix
  ];

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

  services.jellyfin = {
    enable = true;
    openFirewall = true;
    user = "goose";
    group = "video";
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

  services.flaresolverr = {
    enable = true;
    openFirewall = true;
  };

  systemd.services.flaresolverr.environment = {
    LOG_LEVEL = "debug";
  };
}
