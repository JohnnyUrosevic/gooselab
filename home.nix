{ config, pkgs, ... }:

{
	home.username = "goose";
	home.homeDirectory = "/home/goose";
	programs.git.enable = true;
	home.stateVersion = "25.05";

	home.file.".config/nvim".source = config.lib.file.mkOutOfStoreSymlink ./dotfiles/.config/nvim;

	home.packages = with pkgs; [
		neovim-unwrapped
		ripgrep
		gcc
		nodejs
		nil
		nixpkgs-fmt
	];
}
