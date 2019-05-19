{ config, pkgs, ... }:
{
  networking.hostName = "laptop";

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true; 

  own = {
    ssh = {
      enable = true;
      agent = true;
    };
    gui.enable = true;
    docker.enable = true;
    virtualisation.enable = true;
    steam.enable = true;
  };

  qemu-user.aarch64 = true;

}
