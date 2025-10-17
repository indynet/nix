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
    _1password-gui
    _1password-cli
    iosevka
    ripgrep
    spotify
    slurp
    grim
    bash
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
    nixvim   = i ./programs/nixvim/nixvim.nix;
    emacs    = i ./programs/emacs/emacs.nix;
    wofi     = i ./programs/wofi/wofi.nix;
    bash     = i ./programs/bash.nix;
    ssh      = i ./programs/ssh.nix;
    git      = i ./programs/git.nix;
  };
}
