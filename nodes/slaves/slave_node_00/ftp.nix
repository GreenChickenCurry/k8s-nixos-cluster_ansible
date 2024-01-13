{ config, pkgs, ... }:

{

  services.vsftpd = {
    enable = true;
    #cannot chroot && write
    #chrootlocalUser = true;
    writeEnable = true;
    localUsers = true;
    userlist = [ "q" "root" ];
    userlistEnable = true;
    extraConfig = "pasv_min_port=56250\npasv_max_port=56260";
  };


}
