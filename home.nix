{ pkgs, ... }:

{
  imports = [ ./shell ];

  home = {
    username = "ruhrozz";
    homeDirectory = "/home/ruhrozz";
    stateVersion = "24.05";
    packages = with pkgs; [
      micromamba
      dust
      duf
      (nerdfonts.override { fonts = [ "Hack" ]; })
    ];

    sessionVariables = {
      EDITOR = "nvim";
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
