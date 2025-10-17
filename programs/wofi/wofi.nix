{ pkgs, ... }:
let style = builtins.readFile ./styles.css;
in {
  inherit style;

  settings = {
    height = 250;
    width  = 500;
  };
}
