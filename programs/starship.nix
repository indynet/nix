{ pkgs, ... }:

let schema = "https://starship.rs/config-schema.json";
in {
  enableIonIntegration  = true;

  settings              = {
    "$schema"   = schema;

    add_newline = false;

    format      = "$directory\\$ ";
  };
}
