{ ... }:

{
  wayland.windowManager.hyprland = {
    settings = {
      cursor = { no_hardware_cursors = true; };
      general = {
        gaps_in = 12;
        gaps_out = 20;
        border_size = 3;
        resize_on_border = true;
        allow_tearing = true;
        layout = "dwindle";
        "col.inactive_border" = "rgba(181825ee)";
        "col.active_border" = "rgba(89b4faee)";
      };

      decoration = {
        rounding = 3;
        active_opacity = 1;
        inactive_opacity = 0.8;
        drop_shadow = false;
        shadow_range = 4;
        shadow_render_power = 3;

        blur = {
          enabled = true;
          passes = 3;
          size = 16;
        };
      };

      exec-once = [
        "swww init & sleep 0.5 && exec sww img ~/Yandex.Disk/Wallpapers Full HD/6.png"
      ];

      animations = {
        enabled = true;

        bezier =
          [ "md3_decel, 0.05, 0.7, 0.1, 1" "workspace, 0.17, 1.17, 0.3, 1" ];

        animation = [
          "border, 1, 2, default"
          "fade, 1, 2, md3_decel"
          "windows, 1, 4, md3_decel, popin 60%"
          "workspaces, 1, 5, workspace, slidefadevert 8%"
        ];
      };

      dwindle = {
        "pseudotile" = true;
        "preserve_split" = true;
      };

      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
        focus_on_activate = true;
        disable_autoreload = false;
        no_direct_scanout = true;
      };

      "$mod" = "SUPER";
      input = {
        "kb_layout" = "us,ru";
        "kb_options" = "grp:alt_shift_toggle";
        "follow_mouse" = true;
      };
      bind = [
        # Fun
        "$mod CTRL ALT, W, exec, swww img `find $HOME/Yandex.Disk/Wallpapers Full HD/ | shuf -n 1`"

        # General
        "$mod, Return, exec, alacritty"
        "$mod, R, exec, wofi --show drun"
        "$mod, B, exec, google-chrome-stable"
        '', Print, exec, grim -l 0 -g "$(slurp)" - | wl-copy''

        # Programs
        "$mod CTRL, T, exec, telegram-desktop"
        "$mod CTRL, V, exec, pavucontrol"
        "$mod CTRL, O, exec, osu!"
        "$mod CTRL, S, exec, steam"
        "$mod CTRL, N, exec, obsidian"

        # Window
        "$mod, W, killactive"
        "$mod, M, exit"
        "$mod, V, togglefloating"
        "$mod, F, fullscreen"
        "$mod, J, togglesplit"

        # Window: move focus
        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"
      ] ++ (
        # workspaces
        # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
        builtins.concatLists (builtins.genList (x:
          let
            ws = let c = (x + 1) / 10; in builtins.toString (x + 1 - (c * 10));
          in [
            "$mod, ${ws}, workspace, ${toString (x + 1)}"
            "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
          ]) 10));

      bindm = [ "$mod, mouse:272, movewindow" "$mod, mouse:273, resizewindow" ];

    };
  };
}
