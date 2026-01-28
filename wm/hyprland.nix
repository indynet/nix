{ pkgs, global, ... }:

with pkgs.lib;

{
  xwayland.enable = true;

  portalPackage   = global.hyprlandPkgs.xdg-desktop-portal-hyprland;
  package         = global.hyprlandPkgs.hyprland;

  plugins         = [
    global.hyprlandPlugins.borders-plus-plus
  ];

  settings        = {
    animations.enabled = true; # yes, please

    "$m"               = "SUPER";

    monitorv2          = [
      {
        output = global.output.name;
        mode   = global.output.mode;
        vrr    = 1;
      }
    ];

    bindm              = [
      "ALT SHIFT, mouse:272, resizewindow"
      "ALT, mouse:272, movewindow"
    ];

    bind               = let
      ito10 = builtins.genList builtins.toString 9;
      binds = concatMap (flip map ito10) [
        (x: "$m SHIFT, ${x}, movetoworkspace, ${x}")
        (x: "$m, ${x}, workspace, ${x}")
      ];
    in binds ++ [
      "$m, a, exec, [float] hyprpwcenter"
      "$m, p, exec, grim -g \"$(slurp)\""
      "$m, f, exec, wofi --show drun"
      "$m SHIFT, j, movewindow, l"
      "$m SHIFT, k, movewindow, r"
      "ALT, v, togglefloating"
      "$m, l, exec, hyprlock"
      "$m, q, exec, wezterm"
      "$m, j, movefocus, l"
      "$m, k, movefocus, r"
      "$m, c, killactive"
      "$m, m, exit"
    ];

    general            = {
      "col.inactive_border" = "0xff444444";
      "col.active_border"   = "0xff444444";

      gaps_out 	            = 15;
      gaps_in  	            = 15;
    };

    plugin             = {
      borders-plus-plus = {
        enabled = true;
      };
    };
  };
}
