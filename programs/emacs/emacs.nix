{ pkgs, global, ... }:

let extraConfig = builtins.readFile ./init.el;
in {
  inherit extraConfig;

  extraPackages = epkgs: with epkgs; [
    gruber-darker-theme
    multiple-cursors
    haskell-mode
    nix-sandbox
    lua-mode
    nix-mode
    magit
  ];
}
