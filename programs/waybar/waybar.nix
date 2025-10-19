{ pkgs, global, ... }:

let style = builtins.readFile ./styles.css;
in {
  inherit style;

  settings = {
    position = "bottom";
    output   = [global.output.name];
  };

  systemd  = {
    enable = true;
  };
}
