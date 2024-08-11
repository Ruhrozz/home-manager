{ config, pkgs, ... }:

{
  programs.thefuck.enable = true;
  programs.thefuck.enableBashIntegration = false;

  programs.zsh = {
    enable = true;
    enableCompletion = false;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    sessionVariables = { ZSH_DISABLE_COMPFIX = true; };

    shellAliases = {
      ll = "ls -l";
      update = "sudo nixos-rebuild switch";
      hms = "home-manager switch --flake ~/nix/home-manager/";
      fuck = "THEFUCK_EXCLUDE_RULES=fix_file fuck";
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
        export MAMBA_EXE='/nix/store/80pl4hvrirdam4g4y39dv1plw9q6kf95-micromamba-1.5.8/bin/micromamba';
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
