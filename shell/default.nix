{
  imports = [ ./zsh.nix ];

  programs.bash.initExtra = ''
    export SHELL=`which zsh`
    [ -z "$ZSH_VERSION" ] && exec "$SHELL" -l
  '';
}
