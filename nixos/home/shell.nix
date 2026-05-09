{ ... }:

{
    programs.git = {
    enable = true;
    settings = {
        user.name = "Gabriel Alcequiez";
        user.email = "gxbbab@gmail.com"; 
    };
    
  };

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    oh-my-zsh = {
        enable = true;
        plugins = [ "git" "sudo" ];
        theme = "arrow";
    };
    shellAliases = {
      ll = "ls -la";
      rbf = "sudo nixos-rebuild switch --flake ~/nixos-33/nixos";
    };
  };
}
