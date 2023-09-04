{ pkgs, config, ... }:
{
  services.swayidle = {
    enable = true;
    timeouts = [
      {
        timeout = 55;
        command = "${pkgs.libnotify}/bin/notify-send 'Locking in 5 seconds' -t 5000";
      }
      {
        timeout = 60;
        command = "${pkgs.swaylock}/bin/swaylock";
      }
      {
        timeout = 90;
        command = "${pkgs.sway}/bin/swaymsg 'output * dpms off'";
        resumeCommand = "${pkgs.sway}/bin/swaymsg 'output * dpms on'";
      }
    ];
    events = [
      {
        event = "before-sleep";
        command = "${pkgs.swaylock}/bin/swaylock";
      }
    ];
  };
}
