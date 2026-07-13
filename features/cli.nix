{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vim
    wget
    git

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
    bat

    ffmpeg

    sops

    tmux
  ];
}
