{ config, pkgs, ... }:
{
  imports = [
    ./git
    ./bash
    ./vim
    ./tmux
    ./network
    ./ranger
    ./devel
    ./termite
    ./awesome
    ./themes
    ./browsers
    ./preset
    ./idea
  ];

  nixpkgs.config.allowUnfree = true; 
  nixpkgs.overlays = [
    ( import ../overlay ) 
  ];

  programs.home-manager.enable = true;

}