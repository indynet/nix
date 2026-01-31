{ global, ... }:

{
  shellAliases = {
    ls = "eza --icons always --color always";
  };

  settings     = {
    show_banner = false;
  };

  configFile   = {
    text = ''
    ${global.term-pets}/bin/term-pets static dino --frame 2
    '';
  };
}
