{
  imports = [ ./eza.nix ./git.nix ];

  programs.thefuck.enable = true; # fix mistakes promptly
  programs.bat.enable = true; # `cat` enhanced
}
