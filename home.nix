{ pkgs, ... }:

{
  imports = [ ./shell ./modules ./nixvim ];

  home = {
    stateVersion = "24.05";
    sessionVariables.EDITOR = "nvim";

    packages = with pkgs; [
      dust
      duf
      pre-commit
      uv
      shellcheck # bashls nixvim plugin dependency
      ripgrep # telescope nixvim plugin dependency
      (nerdfonts.override { fonts = [ "Hack" ]; })
    ];
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
