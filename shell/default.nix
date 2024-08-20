{
  imports = [ ./zsh.nix ];

  programs.thefuck.enable = true; # fix shell mistakes
  programs.bat.enable = true; # `cat` enhanced

  # `ls` enhanced
  programs.eza = { 
    enable = true;
    git = true;
    icons = true;
    extraOptions = [
      "--group-directories-first"
      "--header"
    ];
  };

  programs.bash.initExtra = ''
    export SHELL=`which zsh`
    [ -z "$ZSH_VERSION" ] && exec "$SHELL" -l
  '';
}
