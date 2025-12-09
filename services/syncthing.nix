{ global, pkgs, ... }:

{
  openDefaultPorts = true;

  settings         = {
    folders = global.sync.folders;
    devices = global.sync.devices;
    gui     = {
      password = global.pass;
      user     = global.name;
    };
  };
}
