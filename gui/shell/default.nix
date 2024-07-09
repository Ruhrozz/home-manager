{ pkgs, ... }:

{
  programs.alacritty = {
    enable = true;

    settings = {
      shell.program = "${pkgs.zsh}/bin/zsh";

      font = {
        size = 12.0;

        bold.family = "Hack Nerd Font Mono";
        bold.style = "Bold";

        bold_italic.family = "Hack Nerd Font Mono";
        bold_italic.style = "Bold Italic";

        italic.family = "Hack Nerd Font Mono";
        italic.style = "Italic";

        normal.family = "Hack Nerd Font Mono";
        normal.style = "Regular";
      };

      live_config_reload = true;
      scrolling.history = 10000;
      selection.save_to_clipboard = false;

      window = {
        opacity = 0.9;

        class.general = "Alacritty";
        class.instance = "Alacritty";

        padding.x = 10;
        padding.y = 10;
      };

      colors = {
        draw_bold_text_with_bright_colors = true;

        primary = {
          background = "#1e1e2e";
          foreground = "#cdd6f4";
          dim_foreground = "#7f849c";
          bright_foreground = "#cdd6f4";
        };

        cursor = {
          cursor = "#7f849c";
          text = "#1e1e2e";
        };

        vi_mode_cursor = {
          cursor = "#7f849c";
          text = "#1e1e2e";
        };

        bright = {
          black = "#585b70";
          red = "#f38ba8";
          green = "#a6e3a1";
          yellow = "#f9e2af";
          blue = "#89b4fa";
          magenta = "#f5c2e7";
          cyan = "#94e2d5";
          white = "#a6adc8";
        };

        normal = {
          black = "#45475a";
          red = "#f38ba8";
          green = "#a6e3a1";
          yellow = "#f9e2af";
          blue = "#89b4fa";
          magenta = "#f5c2e7";
          cyan = "#94e2d5";
          white = "#bac2de";
        };

        dim = {
          black = "#45475a";
          red = "#f38ba8";
          green = "#a6e3a1";
          yellow = "#f9e2af";
          blue = "#89b4fa";
          magenta = "#f5c2e7";
          cyan = "#94e2d5";
          white = "#bac2de";
        };

        search.matches = {
          foreground = "#1e1e2e";
          background = "#a6adc8";
        };

        search.focused_match = {
          foreground = "#1e1e2e";
          background = "#a6e3a1";
        };

        footer_bar = {
          foreground = "#1e1e2e";
          background = "#a6adc8";
        };

        hints.start = {
          foreground = "#1e1e2e";
          background = "#f9e2af";
        };

        hints.end = {
          foreground = "#1e1e2e";
          background = "#a6adc8";
        };

        selection = {
          text = "#1e1e2e";
          background = "#f5e0dc";
        };

        indexed_colors = [
          {
            index = 16;
            color = "#fab387";
          }
          {
            index = 17;
            color = "#f5e0dc";
          }
        ];
      };
    };
  };
}
