{ pkgs, global, nixvim, ... }: let f = { enable = true; };
                                   i = x: (import x { inherit pkgs global; }) // f;
in {
  programs.home-manager.enable = true;

  home.stateVersion            = "25.05";

  home.homeDirectory           = "/home/" + global.name;
  home.username                = global.name;

  home.pointerCursor           = i ./home/cursor.nix;

  home.packages                = with pkgs; [
    nerd-fonts.iosevka
    telegram-desktop
    _1password-gui
    _1password-cli
    pavucontrol
    alsa-utils
    iosevka
    ripgrep
    spotify
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
    blanket = i ./services/blanket.nix;
    mako    = i ./services/mako.nix;
  };

  programs                     = {
    chromium = i ./programs/chromium.nix;
    starship = i ./programs/starship.nix;
    hyprlock = i ./programs/hyprlock.nix;
    wezterm  = i ./programs/wezterm/wezterm.nix;
    vesktop  = i ./programs/vesktop.nix;
    direnv   = i ./programs/direnv.nix;
    nixvim   = i ./programs/nixvim/nixvim.nix;
    waybar   = i ./programs/waybar/waybar.nix;
    emacs    = i ./programs/emacs/emacs.nix;
    wofi     = i ./programs/wofi/wofi.nix;
    bash     = i ./programs/bash.nix;
    ssh      = i ./programs/ssh.nix;
    git      = i ./programs/git.nix;
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
