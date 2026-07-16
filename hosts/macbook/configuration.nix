{ pkgs, ... }:

{
  imports = [
    ../../features
  ];

  users.users.goose = {
    description = "Johnny Urosevic";
    home = "/Users/goose";
    shell = pkgs.zsh;
    uid = 501;
  };

  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  system.stateVersion = 7; 
}
