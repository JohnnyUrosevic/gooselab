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

  system.stateVersion = 7; 
}
