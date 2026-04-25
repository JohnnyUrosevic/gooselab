{ config, pkgs, ... }:
let
  dotfiles = "${config.home.homeDirectory}/gooselab/dotfiles/.config";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  configs = {
    nvim = "nvim";
  };
in

{
  home.username = "goose";
  home.homeDirectory = "/home/goose";
  programs.git.enable = true;
  home.stateVersion = "25.05";

  home.file.".alias".source = ./dotfiles/.alias;
  home.file.".zshrc".source = ./dotfiles/.zshrc;
  home.file.".vimrc".source = ./dotfiles/.vimrc;
  home.file.".gitconfig".source = ./dotfiles/.gitconfig;

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

    cowsay
    fortune-kind
    zoxide

    lazygit
  ];

    programs.tmux = {
      enable = true;
      shell = "${pkgs.zsh}/bin/zsh";
    };
}
