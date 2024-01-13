{ config, pkgs, ... }:

{

  networking.hostName = "k8s-slave-00";
  networking.extraHosts = ''
    192.168.100.70 k8s-master-00
    192.168.100.80 k8s-slave-00
    192.168.100.81 k8s-slave-01
  '';
  networking.useDHCP = false;
  networking.defaultGateway = "192.168.100.1";
  networking.nameservers = [ "192.168.100.1" ];
  networking.interfaces.ens18.useDHCP = false;
  networking.interfaces.ens18.ipv4.addresses = [{
    address = "192.168.100.80";
    prefixLength = 24;
  }];

  networking.firewall.enable = false;

  services.openssh.enable = true;
  services.openssh.settings.PermitRootLogin = "yes";

  environment.systemPackages = with pkgs; [
    dig
    traceroute
    nettools
  ];

}
