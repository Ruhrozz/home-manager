{ pkgs, ... }:

{
  imports = [ ./gui ./shell ];

  home = {
    username = "ruhrozz";
    homeDirectory = "/home/ruhrozz";
    stateVersion = "24.05";
    packages = with pkgs; [
      micromamba
      (nerdfonts.override { fonts = [ "Hack" ]; })
    ];

    sessionVariables = {
      EDITOR = "nvim";
      SDL_VIDEODRIVER = "wayland";
      CLUTTER_BACKEND = "wayland";
      GDK_BACKEND = "wayland";
      QT_QPA_PLATFORM = "wayland";
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # GitHub options
  programs.git = {
    enable = true;
    lfs.enable = true;

    userName = "Ruhrozz";
    userEmail = "ruhrozz@bk.ru";

    diff-so-fancy.enable = true;
  };
}
