{ config, lib, pkgs, ... }:

{
  imports =
    [ <nixpkgs/nixos/modules/installer/scan/not-detected.nix> ];

  boot.initrd.availableKernelModules = [
    "xhci_pci"
    "ahci"
    "usb_storage"
    "usbhid"
    "sd_mod"
  ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  boot.initrd.luks = {
    reusePassphrases = true;
    devices = {
      "nixos-encrypted".device = "/dev/disk/by-uuid/508f5923-d0a4-48c7-bd82-1f2b730d9188";
      "data".device = "/dev/disk/by-uuid/a0dc4c66-e374-43e3-8279-ba4622f63455"; 
    };
  };

  fileSystems = {
    "/boot" = {
      device = "/dev/disk/by-uuid/9974-0879";
      fsType = "vfat"; 
    };
    "/" = { 
      device = "/dev/disk/by-uuid/acb8824c-4050-40f6-83d4-34a46f8164ac";
      fsType = "btrfs";
    };
    "/mnt/data/" = { 
      device = "/dev/disk/by-uuid/0260de44-87ec-4ec0-a5fc-328f9e00d782";
      fsType = "btrfs";
    };
  };

  swapDevices = [ ];

  nix.maxJobs = lib.mkDefault 1;
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";

}
