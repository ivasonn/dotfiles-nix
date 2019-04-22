{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ranger
    w3m
  ];

  home.file.".config/ranger/commands.py".text = builtins.readFile ./ranger/commands.py;
  home.file.".config/ranger/commands_full.py".text = builtins.readFile ./ranger/commands_full.py;
  home.file.".config/ranger/rc.conf".text = builtins.readFile ./ranger/rc.conf;
  home.file.".config/ranger/rifle.conf".text = builtins.readFile ./ranger/rifle.conf;
  home.file.".config/ranger/scope.sh" = {
    text = builtins.readFile ./ranger/scope.sh;
    executable = true;
  };

}
