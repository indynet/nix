{ ... }:

{
  musicDirectory = "/home/indy/org/music";

  extraConfig = ''
      audio_output {
        type "pipewire"
        name "PIPEWIRE"
      }
  '';
}
