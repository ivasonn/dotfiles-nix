{ config, pkgs, ... }:
{
  imports = [
    "${builtins.fetchTarball https://github.com/rycee/home-manager/tarball/ba0375bf06e0e0c3b2377edf913b7fddfd5a0b40}/nixos"
    ./modules
    ./host/configuration.nix
    ./host/hardware-configuration.nix
  ];

  system.stateVersion = "19.03";

  nixpkgs.overlays = [
    ( import ./overlay ) 
  ];

  environment.systemPackages = with pkgs; [
    sudo
  ];

  networking.nameservers = [ "8.8.8.8" "8.8.4.4" ];

  time.timeZone = "Europe/Moscow";

  services.openvpn.servers = config.own.secrets.vpn;

  users.users = with pkgs; {
    root = {
      shell = fish;
    };
    user = {
      shell = fish;
      isNormalUser = true;
      uid = 1000;
      initialPassword = "user";
      extraGroups = [
        "wheel"
        "vboxusers"
        "docker"
        "libvirtd"
      ];
      openssh.authorizedKeys.keys = config.own.secrets.authorized-keys;
    };
  } // (if config.own.secrets.git.server then {
    git = {
      isNormalUser = true;
      createHome = true;
      shell = "${pkgs.git}/bin/git-shell";
      openssh.authorizedKeys.keys = config.own.secrets.authorized-keys;
    };
  } else { });

  security.sudo.wheelNeedsPassword = false;

  home-manager.users."root" = import ./dotfiles/home.nix;
  home-manager.users."user" = import ./dotfiles/home.nix;

}