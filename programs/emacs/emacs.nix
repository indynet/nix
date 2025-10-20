{ pkgs, global, ... }:

let extraConfig = builtins.readFile ./init.el;
in {
  inherit extraConfig;

  extraPackages = epkgs: with epkgs; [
    rainbow-identifiers
    gruber-darker-theme
    visual-fill-column
    multiple-cursors
    haskell-mode
    lua-mode
    nix-mode
    tuareg
    direnv
    volume
    telega
    magit
    bongo
    smex
  ];
}
