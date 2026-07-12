
{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    zsh-powerlevel10k
  ];

  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    enableBashCompletion = true;
    promptInit = ''
      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
    '';
    ohMyZsh = {
      enable = true;
      plugins = [ "git" ];
    };

    shellAliases = {
      build = "sudo nixos-rebuild switch --impure --flake=/home/goose/gooselab/";
    };
  };
}
