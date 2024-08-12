{ config, pkgs, ... }:

{
  home.file = {
    ".bash_login".text = ''
      export SHELL=`which zsh`
      [ -z "$ZSH_VERSION" ] && exec "$SHELL" -l
    '';
  };

  programs.zsh = {
    enable = true;
    autocd = false;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    sessionVariables.ZSH_DISABLE_COMPFIX = true;

    shellAliases = {
      hms = "home-manager switch --flake ~/nix/home-manager/";

      # utils
      fuck = "THEFUCK_EXCLUDE_RULES=fix_file fuck";
      cat = "bat";

      # micromamba
      mm = "micromamba";
      mma = "micromamba activate";
      mmd = "micromamba deactivate";
    };

    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };

    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
      {
        name = "powerlevel10k-config";
        src = ./p10k-config;
        file = "p10k.zsh";
      }
    ];

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "thefuck" ];
      theme = "robbyrussell";
    };

    initExtra = ''
      # >>> mamba initialize >>>
      # !! Contents within this block are managed by 'mamba init' !!
      export MAMBA_EXE=`which micromamba`;
      export MAMBA_ROOT_PREFIX='/home/malofeev/micromamba';
      __mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
      if [ $? -eq 0 ]; then
          eval "$__mamba_setup"
      else
          alias micromamba="$MAMBA_EXE"  # Fallback on help from mamba activate
      fi
      unset __mamba_setup
      # <<< mamba initialize <<<
    '';
  };
}