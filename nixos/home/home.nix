{ config, pkgs, ... }:

{
  home.username = "gxbbab";
  home.homeDirectory = "/home/gxbbab";
  home.stateVersion = "25.11";

  programs.git = {
    enable = true;
    userName = "Gabriel Alcequiez";
    userEmail = "gxbbab@gmail.com"; 
  };

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    shellAliases = {
      ll = "ls -la";
      rbf = "sudo nixos-rebuild switch --flake ~/nixos33/nixos";
    };
  };

}
