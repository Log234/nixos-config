{inputs, username, host, ...}: {
  imports = [
    ./aseprite/aseprite.nix           # pixel art editor
    ./audacious.nix                   # music player
    ./bat.nix                         # better cat command
    ./browser.nix                     # firefox based browser
    ./btop.nix                        # resouces monitor 
    ./bottom.nix                      # resouces monitor
    ./cava.nix                        # audio visualizer
    ./discord/discord.nix             # discord with gruvbox
    ./fastfetch.nix                   # fetch tool
    ./fzf.nix                         # fuzzy finder
    ./git.nix                         # version control
    ./gnome.nix                       # gnome apps
    ./gtk.nix                         # gtk theme
    ./hyprland                        # window manager
    ./kitty.nix                       # terminal
    ./swayosd.nix                     # brightness / volume wiget
    ./swaync/swaync.nix               # notification deamon
    ./micro.nix                       # nano replacement
    ./nemo.nix                        # file manager
    ./nvim.nix                        # neovim editor
    ./p10k/p10k.nix
    ./packages.nix                    # other packages
    ./rofi.nix                        # launcher
    ./scripts/scripts.nix             # personal scripts
    ./spicetify.nix                   # spotify client
    ./starship.nix                    # shell prompt
    ./swaylock.nix                    # lock screen
    ./viewnior.nix                    # image viewer
    ./waybar                          # status bar
    ./xdg-mimes.nix                   # xdg config
    ./zsh                             # shell
    inputs.catppuccin.homeManagerModules.catppuccin
  ];
}
