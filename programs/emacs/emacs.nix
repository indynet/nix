{ pkgs, global, ... }:

let extraConfig = builtins.readFile ./init.el;
in {
  inherit extraConfig;

  extraPackages = epkgs: with epkgs; [
    rainbow-identifiers
    gruber-darker-theme
    rainbow-delimiters
    multiple-cursors
    haskell-mode
    idris2-mode
    lua-mode
    nix-mode
    tuareg
    direnv
    magit
    smex
  ];
}
