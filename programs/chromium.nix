{ pkgs, ... }:

{
  package    = pkgs.ungoogled-chromium;

  extensions = [
			{ id = "eimadpbcbfnmbkopoojfekhnkhdbieeh"; } # darkreader
			{ id = "aeblfdkhhhdcdjpifhhbdiojplfjncoa"; } # 1password
  ];
}
