{ pkgs, lib, ... }:

{
  imports = [ ./hyprland ./waybar ];

  wayland.windowManager.hyprland.enable = true;

  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "osu-lazer"
      "yandex-disk"
      "obsidian"
      "google-chrome"
      "vista-fonts"
      "yandex-browser-stable"
    ];

  nixpkgs.config.permittedInsecurePackages =
    [ "yandex-browser-stable-24.4.1.951-1" ];

  # For screenshot only
  home.packages = with pkgs; [
    # Hyprland screenshot hotkey
    # --------------------------
    wl-clipboard
    grim
    slurp
    # App navigation
    # --------------
    wofi
    # Filesystem navigation
    # ---------------------
    dolphin
    # Desktop programs
    # ----------------
    alacritty
    osu-lazer
    pipewire
    pavucontrol
    telegram-desktop
    obsidian
    google-chrome
    opentabletdriver
    yandex-disk
    yandex-browser
  ];
}
