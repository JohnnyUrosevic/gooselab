{ config, pkgs, ... }:

{
	home.username = "goose";
	home.homeDirectory = "/home/goose";
	programs.git.enable = true;
	home.stateVersion = "25.05";
}
