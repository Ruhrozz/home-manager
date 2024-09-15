{ pkgs, ... }:

{
  imports = [ ./shell ./git.nix ./nixvim ];

  programs.nixvim.enable = true;

  home = {
    username = "ruhrozz";
    homeDirectory = "/home/ruhrozz";
    stateVersion = "24.05";

    sessionVariables.EDITOR = "nvim";
  };

  home.packages = with pkgs; [
    micromamba
    dust
    duf
    (nerdfonts.override { fonts = [ "Hack" ]; })
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
