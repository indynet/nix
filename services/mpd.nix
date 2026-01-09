{ ... }:

{
  musicDirectory = "/home/indy/org/music";

  extraConfig = ''
      audio_output {
        type "alsa"
        name "ALSA"
        mixer_type		"hardware"
        mixer_device	"default"
        mixer_control	"PCM"
      }
 '';
}
