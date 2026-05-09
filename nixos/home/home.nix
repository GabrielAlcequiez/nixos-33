{ config, pkgs, ... }:

{
  imports = [
    ./shell.nix
    ./kitty.nix
    ./fastfetch/fastfetch.nix
  ];

  home.username = "gxbbab";
  home.homeDirectory = "/home/gxbbab";
  home.stateVersion = "25.11";

}
