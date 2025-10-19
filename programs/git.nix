{ pkgs, global, ... }:

{
  settings.userEmail   = global.email;
  settings.userName    = global.name;

  settings.extraConfig = {
    "gpg \"ssh\"" = {
    	program = "${pkgs.lib.getExe' pkgs._1password-gui "op-ssh-sign"}";
    };

    commit        = {
      gpgsign = true;
    };

    user          = {
      signingKey = global.key;
    };

    gpg           = {
      format = "ssh";
    };
  };
}
