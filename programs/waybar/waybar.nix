{ pkgs, global, ... }:

let style = builtins.readFile ./styles.css;
in {
  inherit style;

  settings = {
    mainBar = {
      modules-center = [
        "clock"
      ];

      position     = "bottom";

      height       = 30;
      spacing      = 4;

      output       = [
        global.output.name
      ];

      clock        = {
        format-alt = "{:%Y-%m-%d}";
      };
    };
  };

  systemd  = {
    enable = true;
  };
}
