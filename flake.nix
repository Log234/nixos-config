{
  description = "FrostPhoenix's nixos configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nur.url = "github:nix-community/NUR";
    catppuccin.url = "github:catppuccin/nix";
    hypr-contrib.url = "github:hyprwm/contrib";
    hyprpicker.url = "github:hyprwm/hyprpicker";
  
    alejandra.url = "github:kamadorueda/alejandra/3.0.0";
  
    nix-gaming.url = "github:fufexan/nix-gaming";
  
    hyprland = {
      type = "git";
      url = "https://github.com/hyprwm/Hyprland";
      submodules = true;
    };
  
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin-bat = {
      url = "github:catppuccin/bat";
      flake = false;
    };

    catppuccin-cava = {
      url = "github:catppuccin/cava";
      flake = false;
    };

    catppuccin-starship = {
      url = "github:catppuccin/starship";
      flake = false;
    };
    
    spicetify-nix = {
      url = "github:gerg-l/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprmag.url = "github:SIMULATAN/hyprmag";

    nix-flatpak.url = "github:gmodena/nix-flatpak";

    zen-browser.url = "github:fufexan/zen-browser-flake";
  };

  outputs = { nixpkgs, self, ...} @ inputs:
  let
    username = "log234";
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
    lib = nixpkgs.lib;
  in
  {
    nixosConfigurations = {
      desktop = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [ ./hosts/desktop ];
        specialArgs = { host="desktop"; inherit self inputs username ; };
      };
      laptop = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [ ./hosts/laptop ];
        specialArgs = { host="laptop"; inherit self inputs username ; };
      };
       vm = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [ ./hosts/vm ];
        specialArgs = { host="vm"; inherit self inputs username ; };
      };
    };
  };
}
