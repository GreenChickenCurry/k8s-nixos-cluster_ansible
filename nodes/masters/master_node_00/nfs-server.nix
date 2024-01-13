{ config, pkgs, ... }:

{

  fileSystems."/export/one" = {
    device = "/mnt/one";
    options = [ "bind" ];
  };

  fileSystems."/export/two" = {
    device = "/mnt/two";
    options = [ "bind" ];
  };

  fileSystems."/export/three" = {
    device = "/mnt/three";
    options = [ "bind" ];
  };

  fileSystems."/export/four" = {
    device = "/mnt/four";
    options = [ "bind" ];
  };

  services.nfs.server.enable = true;
  services.nfs.server.exports = ''
    /export        192.168.100.70(rw,fsid=0,no_subtree_check,no_root_squash) 192.168.100.80(rw,fsid=0,no_subtree_check,no_root_squash) 192.168.100.81(rw,fsid=0,no_subtree_check,no_root_squash)
    /export/one    192.168.100.70(rw,nohide,insecure,no_subtree_check,no_root_squash) 192.168.100.80(rw,nohide,insecure,no_subtree_check,no_root_squash) 192.168.100.81(rw,nohide,insecure,no_subtree_check,no_root_squash)
    /export/two    192.168.100.70(rw,nohide,insecure,no_subtree_check,no_root_squash) 192.168.100.80(rw,nohide,insecure,no_subtree_check,no_root_squash) 192.168.100.81(rw,nohide,insecure,no_subtree_check,no_root_squash)
    /export/three  192.168.100.70(rw,nohide,insecure,no_subtree_check,no_root_squash) 192.168.100.80(rw,nohide,insecure,no_subtree_check,no_root_squash) 192.168.100.81(rw,nohide,insecure,no_subtree_check,no_root_squash)
    /export/four   192.168.100.70(rw,nohide,insecure,no_subtree_check,no_root_squash) 192.168.100.80(rw,nohide,insecure,no_subtree_check,no_root_squash) 192.168.100.81(rw,nohide,insecure,no_subtree_check,no_root_squash)
  ''; 


}
