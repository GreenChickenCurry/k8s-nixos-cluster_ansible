{ config, pkgs, ... }:
let
  kubeMasterIP = "192.168.100.70";
  kubeMasterHostname = "k8s-master-00";
  kubeMasterAPIServerPort = 6443;
in
{

  environment.systemPackages = with pkgs; [
    kompose
    kubectl
    kubernetes
  ];

  services.kubernetes = let
    api = "https://${kubeMasterHostname}:${toString kubeMasterAPIServerPort}";
  in
  {
    roles = ["node"];
    masterAddress = kubeMasterHostname;
    easyCerts = true;

    # point kubelet and other services to kube-apiserver
    kubelet.kubeconfig.server = api;
    apiserverAddress = api;

    # use coredns
    addons.dns.enable = true;

    # needed if you use swap
    #kubelet.extraOpts = "--fail-swap-on=false";
  };

  services.flannel.backend = {
    Type = "host-gw";
  };
}
