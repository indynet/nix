{ pkgs, global, ... }:

let extraConfig = builtins.readFile ./init.el;
in {
  inherit extraConfig;

  extraPackages = epkgs: with epkgs; [
    gruber-darker-theme
    multiple-cursors
    haskell-mode
    lua-mode
    nix-mode
    tuareg
    direnv
    volume
    magit
    bongo
    smex
  ];
}
