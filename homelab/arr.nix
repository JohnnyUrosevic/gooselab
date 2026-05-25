{ pkgs, ... }:
let
  sharedAttrs = {
    enable = true;
    openFirewall = true;
  };
  gooseUser = {
    user = "goose";
  };
in
{
  services.radarr = sharedAttrs // gooseUser;
  services.sonarr = sharedAttrs // gooseUser;
  services.bazarr = sharedAttrs // gooseUser;

  services.prowlarr = sharedAttrs;

  services.jellyfin = sharedAttrs // gooseUser // {
    group = "video";
  };

  environment.systemPackages = [
    pkgs.jellyfin
    pkgs.jellyfin-web
    pkgs.jellyfin-ffmpeg
  ];

  services.seerr = sharedAttrs;
}
