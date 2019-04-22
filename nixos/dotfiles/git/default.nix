{ config, pkgs, lib, ... }:
let cfg = (import <nixpkgs/nixos> {}).config.own.secrets.git; in
let enable = (cfg.server or cfg.name or cfg.email) != null; in
with lib; with types;
{
  config = {
    programs.git = {
      enable = enable;
      userName = cfg.name;
      userEmail = cfg.email;
      extraConfig = {
        core = {
          autocrlf = "input";
          editor = "vim";
        };
      };
      ignores = [
        ".idea/"
        ".python-version"
      ];
    };

  };
}