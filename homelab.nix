{ pkgs, ... }:

{
  imports = [
    ./downloads.nix
    ./byparr.nix
    ./reverse_proxy.nix
    ./dns.nix
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

  services.seerr = {
    enable = true;
    openFirewall = true;
  };
}
