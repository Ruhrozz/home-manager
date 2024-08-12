{
  imports = [ ./zsh.nix ];

  programs.thefuck.enable = true; # fix shell mistakes
  programs.bat.enable = true; # `cat` enhanced

  programs.bash.initExtra = ''
    export SHELL=`which zsh`
    [ -z "$ZSH_VERSION" ] && exec "$SHELL" -l
  '';
}
