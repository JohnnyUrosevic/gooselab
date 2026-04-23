{ config, pkgs, ... }:
let
  dotfiles = "${config.home.homeDirectory}/gooselab/dotfiles/.config";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  configs = {
    nvim = "nvim";
    tmux = "tmux";
  };
in

{
  home.username = "goose";
  home.homeDirectory = "/home/goose";
  programs.git.enable = true;
  home.stateVersion = "25.05";

  xdg.configFile = builtins.mapAttrs (name: subpath: {
    source = create_symlink "${dotfiles}/${subpath}";
    recursive = true;
  }) configs;

  home.packages = with pkgs; [
    neovim
    ripgrep
    gcc
    nodejs
    nil
    nixpkgs-fmt

    tmux
  ];
}
