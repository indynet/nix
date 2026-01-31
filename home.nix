{ pkgs, global, nixvim, ... }: let f = { enable = true; };
                                   i = x: (import x { inherit pkgs global; }) // f;
in {
  programs.home-manager.enable = true;

  home.stateVersion            = "25.05";

  home.homeDirectory           = "/home/" + global.name;
  home.username                = global.name;

  home.pointerCursor           = i ./home/cursor.nix;

  home.packages                = with pkgs; [
    wineWowPackages.stable
    nerd-fonts.iosevka
    _1password-gui
    _1password-cli
    prismlauncher
    hyprpwcenter
    winetricks
    alsa-utils
    iosevka
    ripgrep
    spotify
    unzip
    slurp
    grim
    bash
    vlc
  ];

  imports                      = [
    nixvim.homeModules.nixvim
  ];

  wayland.windowManager        = {
    hyprland = i ./wm/hyprland.nix;
  };

  gtk                          = i ./home/gtk.nix;

  services                     = {
    hyprpolkitagent = i ./services/hyprpolkitagent.nix;
    mpd-discord-rpc = i ./services/mpd-discord-rpc.nix;
    mpd-mpris       = i ./services/mpd-mpris.nix;
    syncthing       = i ./services/syncthing.nix;
    hyprpaper       = i ./services/hyprpaper.nix;
    blanket         = i ./services/blanket.nix;
    mako            = i ./services/mako.nix;
    mpd             = i ./services/mpd.nix;
  };

  programs                     = {
    quickshell = i ./programs/quickshell.nix;
    chromium   = i ./programs/chromium.nix;
    starship   = i ./programs/starship.nix;
    hyprlock   = i ./programs/hyprlock.nix;
    wezterm    = i ./programs/wezterm/wezterm.nix;
    vesktop    = i ./programs/vesktop.nix;
    direnv     = i ./programs/direnv.nix;
    nixvim     = i ./programs/nixvim/nixvim.nix;
    lutris     = i ./programs/lutris.nix;
    emacs      = i ./programs/emacs/emacs.nix;
    wofi       = i ./programs/wofi/wofi.nix;
    ion        = i ./programs/ion.nix;
    ssh        = i ./programs/ssh.nix;
    git        = i ./programs/git.nix;
  };

  home.file."side-update.sh" = {
    enable     = true;
    executable = true;

    text       = ''
    #!/bin/sh
    nix flake update indynet --flake /etc/nixos
    nixos-rebuild switch
    '';
  };

  home.file."full-update.sh" = {
    enable     = true;

    executable = true;

    text       = ''
    #!/bin/sh
    nix flake update --flake /etc/nixos
    nixos-rebuild switch
    '';
  };
}
