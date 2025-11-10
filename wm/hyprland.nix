{ pkgs, global, ... }:

with builtins;
with pkgs.lib;

{
  xwayland.enable = true;

  portalPackage   = global.hyprlandPkgs.xdg-desktop-portal-hyprland;
  package         = global.hyprlandPkgs.hyprland;

  settings        = {
    animations.enabled = false;

    "$m"      = "SUPER";

    monitorv2 =
      let
        monitors = map f (attrNames global.output);
        f        = x: {
          output = x;
          mode   = global.output.${x}.mode;
        };
      in monitors;

    bindm     = [
    	"$m SHIFT, mouse:272, resizewindow"
	"$m, mouse:272, movewindow"
    ];

    bind      = let
      ito10 = builtins.genList builtins.toString 9;
      binds = concatMap (flip map ito10) [
        (x: "$m SHIFT, ${x}, movetoworkspace, ${x}")
        (x: "$m, ${x}, workspace, ${x}")
      ];
    in binds ++ [
				"$m, p, exec, grim -g \"$(slurp)\""
				"$m, f, exec, wofi --show drun"
				"$m SHIFT, j, movewindow, l"
				"$m SHIFT, k, movewindow, r"
				"$m, l, exec, hyprlock"
				"$m, q, exec, wezterm"
				"$m, j, movefocus, l"
				"$m, k, movefocus, r"
				"$m, c, killactive"
				"$m, m, exit"
	  ];

    general   = {
				"col.inactive_border" = "0xff444444";
				"col.active_border"   = "0xff444444";

				gaps_out 	            = 0;
				gaps_in  	            = 0;
    };
  };
}
