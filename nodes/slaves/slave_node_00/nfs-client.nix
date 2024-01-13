{ config, pkgs, ... }:

{

  fileSystems."/mnt/one" = {
    device = "192.168.100.70:/one";
    fsType = "nfs";
  };
  fileSystems."/mnt/two" = {
    device = "192.168.100.70:/two";
    fsType = "nfs";
  };
  fileSystems."/mnt/three" = {
    device = "192.168.100.70:/three";
    fsType = "nfs";
  };
  fileSystems."/mnt/four" = {
    device = "192.168.100.70:/four";
    fsType = "nfs";
  };

}
