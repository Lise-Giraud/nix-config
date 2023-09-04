{ config
, inputs
, lib
, pkgs
, ...
}:
let
  wallpaper = /home/lise/wallpaper/2.jpg;
in
{

  home.packages = with pkgs; [ hyprpaper ];

  # Generate mandatory config file https://github.com/hyprwm/hyprpaper/issues/87
  home.file.".config/hypr/hyprpaper.conf".text = ''
    ipc = on
    preload  = ${wallpaper}
    wallpaper = eDP-1,${wallpaper}
  '';

  # Start hyprpaper deamon
  systemd.user.services.hyprpaper = {
    Unit = {
      Description = "Wayland wallpaper daemon";
      PartOf = [ "graphical-session.target" ];
    };
    Service = {
      ExecStart = "${lib.getExe pkgs.hyprpaper}";
      Restart = "on-failure";
    };
    Install.WantedBy = [ "graphical-session.target" ];
  };
}
