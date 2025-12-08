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
    org-recur
    lua-mode
    nix-mode
    ligature
    tuareg
    envrc
    magit
    smex
  ];
}
