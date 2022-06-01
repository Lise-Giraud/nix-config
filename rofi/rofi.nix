{ pkgs, config, ... }:

{
  enable = true;
  theme = 
  let
      inherit (config.lib.formats.rasi) mkLiteral;
  in {
      "*" = {
          font = "FantasqueSansMono Nerd Font 10";
          show-icons = true;
          icon-theme = "Papirus";
          #cocoa
          #background = mkLiteral "#413E4Aff";
          #background-alt = mkLiteral "#413E4Aff";
          #foreground = mkLiteral "#F7C7B2ff";
          #border = mkLiteral "#B38184ff";
          #border-alt = mkLiteral "#F3B69Eff";
          #selected = mkLiteral "#B381841a";
          #urgent = mkLiteral "#DA4453FF";

          #berry
          background = mkLiteral "#2D142Cff";
          background-alt = mkLiteral "#2D142Cff";
          foreground = mkLiteral "#ffffffA6";
          border = mkLiteral "#EE4540ff";
          border-alt = mkLiteral "#C92A42ff";
          selected = mkLiteral "#510A3299";
          urgent = mkLiteral "#DA4453FF";
       };
          #configuration = {
          #    font = "FantasqueSansMono Nerd Font 10";
          #    show-icons = true;
          #    icon-theme = "Papirus";
          #    display-drun = mkLiteral "";
          #    drun-display-format = mkLiteral "{name}";
          #    disable-history = false;
          #    sidebar-mode = false;
          #};

          window = {
              #transparency = mkLiteral "real";
              background-color = mkLiteral "@background";
              text-color = mkLiteral "@foreground";
              border =  mkLiteral "0% 0% 3% 0%";
              border-color = mkLiteral "@border";
              border-radius = mkLiteral "0% 0% 0% 0%";
              height = mkLiteral "68.50%";
              width = mkLiteral "55%";
              location = mkLiteral "center";
              x-offset = mkLiteral "0";
              y-offset = mkLiteral "0";
          };

          prompt = {
              enabled = true;
              padding = mkLiteral "0% 1% 0% 0%";
              background-color = mkLiteral "@background";
              text-color = mkLiteral "@foreground";
              font = "FantasqueSansMono Nerd Font 12";
          };

          entry = {
              background-color = mkLiteral "@background";
              text-color = mkLiteral "@foreground";
              placeholder-color = mkLiteral "@foreground";
              expand = true;
              horizontal-align = mkLiteral "0";
              placeholder = "Search Applications";
              padding = mkLiteral "0.15% 0% 0% 0%";
              blink = true;
          };

          inputbar = {
              children = mkLiteral "[ prompt, entry ]";
              background-color = mkLiteral "@background";
              text-color = mkLiteral "@foreground";
              expand = false;
              border = mkLiteral "0% 0% 0.3% 0.2%";
              border-radius = mkLiteral "0% 0% 0% 0%";
              border-color = mkLiteral "@border-alt";
              margin = mkLiteral "0% 0% 0% 0%";
              padding = mkLiteral "1%";
              position = mkLiteral "center";
          };

          listview = {
              background-color = mkLiteral "@background";
              columns = mkLiteral "6";
              spacing = mkLiteral "1%";
              cycle = false;
              dynamic = true;
              layout = mkLiteral "vertical";
          };

          mainbox = {
              background-color = mkLiteral "@background";
              border = mkLiteral "0% 0% 3% 0%";
              border-radius = mkLiteral "0% 0% 0% 0%";
              border-color = mkLiteral "@border-alt";
              children = mkLiteral "[ inputbar, listview ]";
              spacing = mkLiteral "2%";
              padding = mkLiteral "2.5% 2% 2.5% 2%";
          };

          element = {
              background-color = mkLiteral "@background";
              text-color = mkLiteral "@foreground";
              orientation = mkLiteral "vertical";
              border-radius = mkLiteral "0%";
              padding = mkLiteral "2% 0% 2% 0%";
          };

          element-icon = {
              background-color = mkLiteral "#00000000";
              text-color = mkLiteral "inherit";
              horizontal-align = mkLiteral "0.5";
              vertical-align = mkLiteral "0.5";
              size = mkLiteral "64px";
              border = mkLiteral "0px";
          };

          element-text = {
              background-color = mkLiteral "#00000000";
              text-color = mkLiteral "inherit";
              expand = true;
              horizontal-align = mkLiteral "0.5";
              vertical-align = mkLiteral "0.5";
              margin = mkLiteral "0.5% 1% 0px 1%";
          };

          "element normal urgent, element alternate urgent" = {
              background-color = mkLiteral "@urgent";
              text-color = mkLiteral "@foreground";
              border-radius = mkLiteral "1%";
          };

          "element normal active, element alternate active" = {
              background-color = mkLiteral "@background-alt";
              text-color = mkLiteral "@foreground";
          };

          "element selected" = {
              background-color = mkLiteral "@selected";
              text-color = mkLiteral "@foreground";
              border = mkLiteral "0% 0% 0.3% 0%";
              border-radius = mkLiteral "0% 0% 0% 0%";
              border-color = mkLiteral "@border-alt";
          };

          "element selected urgent" = {
              background-color = mkLiteral "@urgent";
              text-color = mkLiteral "@foreground";
          };

          "element selected.active" = {
              background-color = mkLiteral "@background-alt";
              color = mkLiteral "@foreground";
          };
      };
  }
