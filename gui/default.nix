{ pkgs, lib, ... }:

{
  imports = [ ./hyprland ./waybar ./wofi ./shell ];

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

  # For screenshot only
  home.packages = with pkgs; [
    # Hyprland screenshot hotkey
    wl-clipboard
    grim
    slurp
    # Wallpapers
    swww
    # Filesystem navigation
    gnome.nautilus
    # Desktop programs
    osu-lazer
    pipewire
    pavucontrol
    telegram-desktop
    obsidian
    google-chrome
    firefox
    opentabletdriver
    yandex-disk
  ];
}
