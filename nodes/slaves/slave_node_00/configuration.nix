{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./k8s.nix
      ./networks.nix
      ./nfs-client.nix
      ./ftp.nix
    ];

  boot.loader.efi = {
    canTouchEfiVariables = true;
    efiSysMountPoint = "/boot/efi";
  };

  boot.loader.grub = {
    enable = true;
    efiSupport = true;
    device = "nodev";
  };

  time.timeZone = "Asia/Yekaterinburg";

  users.users.q = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    initialPassword = "q";
  #   packages = with pkgs; [
  #     firefox
  #     tree
  #   ];
  };

  users.users.root = {
    initialPassword = "q";
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    python311
    wget
    curl
    nano
  ];

  system.stateVersion = "23.05";

}
