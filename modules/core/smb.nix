
{ self, config, pkgs, ...}: 
{
  environment.systemPackages = with pkgs; [
    cifs-utils
  ];

  fileSystems."/mnt/familie" = {
      device = "//truenas/familie";
      fsType = "cifs";
      options = let
        automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";
          in [
            "${automount_opts},credentials=/root/.truenas-credentials"
            "uid=${toString config.users.users.log234.uid}"
            "gid=${toString config.users.groups.users.gid}"
            "rw"
          ];
    };
}
