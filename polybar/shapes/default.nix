{ config, pkgs, ... }:
let

  mypolybar = pkgs.polybar.override {
    alsaSupport = true;
    githubSupport = true;
    mpdSupport = true;
    pulseSupport = true;
  };

  bars = builtins.readFile ./bars.ini;
  colors = builtins.readFile ./colors.ini;
  mods1 = builtins.readFile ./modules.ini;
  mods2 = builtins.readFile ./user_modules.ini;
  mods3 = builtins.readFile ./glyphs.ini; 

in {
  services.polybar = {
    enable = true;
    package = mypolybar;
    config = ./config.ini;
    extraConfig = bars + colors + mods1 + mods2 + mods3;
    script = "PATH=$PATH:${pkgs.i3}/bin polybar main &";
  };
}
