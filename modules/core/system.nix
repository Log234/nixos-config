{ self, pkgs, lib, inputs, systemd, ...}: 
{
  # imports = [ inputs.nix-gaming.nixosModules.default ];
  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
      substituters = [ "https://nix-gaming.cachix.org" ];
      trusted-public-keys = [ "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4=" ];
    };
  };
  nixpkgs = {
    overlays = [
      inputs.nur.overlays.default
    ];
  };

  environment.systemPackages = with pkgs; [
    wget
    git
    cifs-utils
    libva-utils
    vscode-fhs
  ];

  environment.etc."systemd/system.conf.d/99-timeout.conf".text = ''
    DefaultTimeoutStopSec=10s
  '';
  
  console.keyMap = "no";
  time.timeZone = "Europe/Oslo";
  i18n.defaultLocale = "en_US.UTF-8";
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "24.05";
}
