{ pkgs, username, ... }: 
{
  services = {
    xserver = {
      enable = true;
      xkb = {
        layout = "no";
        variant = "nodeadkeys";
      };
      videoDrivers = [ "modesetting" "nvidia" ];
    };

    displayManager.autoLogin = {
      enable = true;
      user = "${username}";
    };
    libinput = {
      enable = true;
      # mouse = {
      #   accelProfile = "flat";
      # };
    };
  };
}
