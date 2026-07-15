
{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    zsh-powerlevel10k
  ];

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    enableBashCompletion = true;
    promptInit = ''
      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
    '';

    # Manually enable oh my zsh like this for nix-darwin compatibility
    interactiveShellInit = ''
      export ZSH="${pkgs.oh-my-zsh}/share/oh-my-zsh"
      source $ZSH/oh-my-zsh.sh
      source $HOME/.p10k.zsh
    '';
  };
}
