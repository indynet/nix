{
  description = "nixos configuration flake";

  inputs      = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs     = { self, nixpkgs, ... }:
    let system = "x86_64-linux";
        pkgs   = import nixpkgs { inherit system; };
    in {
      home = x: import ./home.nix ({ inherit pkgs; } // x);
    };
}
