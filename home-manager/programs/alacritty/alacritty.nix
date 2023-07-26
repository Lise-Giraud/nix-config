{ pkgs, colors }:

{
  enable = true;

  settings = {
    env.TERM = "xterm-256color";
    live_config_reload = true;
    window = {
        title = "Terminal";
        opacity = 0.90;
    };

     font = {
      normal.family = "Fira Code Nerd Font";
      normal.style = "Regular";
      size = 15.0;
    };

    cursor.style = "Beam";

    shell = {
      program = "${pkgs.fish}/bin/fish";
      args = [ "--init-command" "echo; neofetch; echo" ];
    };
     colors = {
      primary = {
        background = "0x2D2A2E";
        foreground = "0xFCFCFA";
      };
      cursor = {
        text   = "0xFF261E";
        cursor = "0xFF261E";
      };
      normal = {
        black   = colors.dark.black;
        red     = colors.dark.brown;
        green   = colors.dark.green;
        yellow  = colors.dark.blue;
        blue    = colors.dark.magenta;
        magenta = colors.dark.red;
        cyan    = colors.dark.yellow;
        white   = colors.dark.white;
      };
      bright = {
        black   = colors.light.black;
        red     = colors.light.brown;
        green   = colors.light.green;
        yellow  = colors.light.blue;
        blue    = colors.light.magenta;
        magenta = colors.light.red;
        cyan    = colors.light.yellow;
        white   = colors.light.white;
      };
    };
  };
}
