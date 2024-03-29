{ pkgs, lib, ... }:

let
  wallpaper = "/home/lise/Pictures/desktop-cube-04.jpg";
  lock = "/home/lise/Pictures/lock.jpg";

  ws1 = "";
  ws2 = "";
  ws3 = "";
  ws4 = "";
  ws5 = "";
  ws6 = "";
  ws7 = "";
  ws8 = "";
  ws9 = "";
  ws0 = "";

in
{
  enable = true;
  package = pkgs.i3-gaps;

  config = rec {
    modifier = "Mod4";
    bars = [ ];

    window.border = 3;

    gaps = {
      inner = 0;
      outer = 0;
    };

    keybindings = lib.mkOptionDefault {
      "${modifier}+Return" = "exec ${pkgs.alacritty}/bin/alacritty";
      "${modifier}+d" = "exec ${pkgs.rofi}/bin/rofi -modi drun -show drun";
      "${modifier}+Shift+q" = "kill";

      # Custom workspaces names
      "${modifier}+1" = "workspace ${ws1}";
      "${modifier}+Shift+1" = "move container to workspace ${ws1}";
      "${modifier}+2" = "workspace ${ws2}";
      "${modifier}+Shift+2" = "move container to workspace ${ws2}";
      "${modifier}+3" = "workspace ${ws3}";
      "${modifier}+Shift+3" = "move container to workspace ${ws3}";
      "${modifier}+4" = "workspace ${ws4}";
      "${modifier}+Shift+4" = "move container to workspace ${ws4}";
      "${modifier}+5" = "workspace ${ws5}";
      "${modifier}+Shift+5" = "move container to workspace ${ws5}";
      "${modifier}+6" = "workspace ${ws6}";
      "${modifier}+Shift+6" = "move container to workspace ${ws6}";
      "${modifier}+7" = "workspace ${ws7}";
      "${modifier}+Shift+7" = "move container to workspace ${ws7}";
      "${modifier}+8" = "workspace ${ws8}";
      "${modifier}+Shift+8" = "move container to workspace ${ws8}";
      "${modifier}+9" = "workspace ${ws9}";
      "${modifier}+Shift+9" = "move container to workspace ${ws9}";
      "${modifier}+0" = "workspace ${ws0}";
      "${modifier}+Shift+0" = "move container to workspace ${ws0}";

      # Lock
      "${modifier}+x" = "exec ${pkgs.betterlockscreen}/bin/betterlockscreen --lock";

      # Brightness
      "XF86MonBrightnessDown" = "exec ${pkgs.light}/bin/light -U 5";
      "XF86MonBrightnessUp" = "exec ${pkgs.light}/bin/light -A 5";

      # Audio
      "XF86AudioLowerVolume" = "exec \"amixer -q sset Master 1%-\"";
      "XF86AudioRaiseVolume" = "exec \"amixer -q sset Master 1%+\"";
      "XF86AudioMute" = "exec \"amixer -q sset Master toggle\"";
    };

    startup = [
      {
        command = "${pkgs.feh}/bin/feh --bg-scale ${wallpaper}";
        always = true;
        notification = false;
      }

      {
        command = "systemctl --user restart polybar";
        always = true;
      }

      {
        command = "xrandr --auto --output DP-2 --mode 1920x1080 --scale 1.25x1.25";
        always = true;
      }

      {
        command = "${pkgs.i3-gaps}/bin/i3-msg workspace ${ws1}";
        always = true;
      }
      {
        command = "${pkgs.betterlockscreen}/bin/betterlockscreen -u ${lock}";
      }
    ];

  };

  extraConfig = ''
    # Remove border
    for_window [class=".*"] border none;
  '';

}
