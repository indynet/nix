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
    inheritenv
    rust-mode
    lua-mode
    nix-mode
    ligature
    tuareg
    envrc
    magit
    smex
  ];
}
