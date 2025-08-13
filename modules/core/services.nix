{ pkgs, ... }: 
{
  services = {
    gvfs.enable = true;
    gnome.gnome-keyring.enable = true;
    dbus = {
      enable = true;
      packages = [ pkgs.libsecret pkgs.gcr_4 ];
    };
    fstrim.enable = true;
    tailscale.enable = true;
  };
  services.logind.extraConfig = ''
    # don’t shutdown when power button is short-pressed
    HandlePowerKey=ignore
  '';
}
