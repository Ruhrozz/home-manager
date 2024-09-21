{ pkgs, ... }:

{
  imports = [ ./shell ./modules ./nixvim ];

  home = {
    stateVersion = "24.05";
    sessionVariables.EDITOR = "nvim";

    packages = with pkgs; [
      micromamba
      dust
      duf
      pre-commit
      uv
      (nerdfonts.override { fonts = [ "Hack" ]; })
    ];
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
