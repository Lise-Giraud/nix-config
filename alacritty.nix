{ pkgs, ... }:

{
  enable = true;

  settings = {
    env.TERM = "xterm-256color";
    live_config_reload = true;

    window = {
      title = "Terminal";

      position = {
        x = 900;
        y = 350;
      };
      dimensions = {
        lines = 40;
        columns = 125;
      };
    };

    background_opacity = 0.85;

    font = {
      normal.family = "Fira Code";
      normal.style = "Regular";
      size = 10.0;
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
        black   = "0x403E41";
        red     = "0xFF6188";
        green   = "0xA9DC76";
        yellow  = "0xFFD866";
        blue    = "0xFC9867";
        magenta = "0xAB9DF2";
        cyan    = "0x78DCE8";
        white   = "0xFCFCFA";
      };
      bright = {
        black   = "0x727072";
        red     = "0xFF6188";
        green   = "0xA9DC76";
        yellow  = "0xFFD866";
        blue    = "0xFC9867";
        magenta = "0xAB9DF2";
        cyan    = "0x78DCE8";
        white   = "0xFCFCFA";
      };
    };
  };
}
