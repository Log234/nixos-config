{ inputs, pkgs, ... }:
{
  programs.cava = {
    enable = true;  
  };
  
  xdg.configFile."cava/config".text = ''
    # custom cava config
  '' + builtins.readFile "${inputs.catppuccin-cava}/themes/mocha.cava";
}
