{
  programs.nixvim = {
    plugins = {
      lsp = {
        enable = true;
        servers = {
          pyright = {
            enable = true;
            autostart = true;
          }; # python

          nil-ls = {
            enable = true;
            autostart = true;
            settings.formatting.command = [
              "nixfmt"
            ]; # It's probably a bug and is not supposed to be here.
          }; # nix

          bashls = {
            enable = true;
            autostart = true;
          }; # bash
        };
        keymaps.lspBuf = {
          K = "hover";
          gD = "references";
          gd = "definition";
          gi = "implementation";
          gt = "type_definition";
        };
      };

      cmp = {
        enable = true;

        cmdline = {
          "/" = {
            mapping = { __raw = "cmp.mapping.preset.cmdline()"; };
            sources = [{ name = "buffer"; }];
          };
          ":" = {
            mapping = { __raw = "cmp.mapping.preset.cmdline()"; };
            sources = [
              { name = "path"; }
              {
                name = "cmdline";
                option = { ignore_cmds = [ "Man" "!" ]; };
              }
            ];
          };
        };

        settings = {
          sources = [
            { name = "nvim_lsp"; }
            { name = "luasnip"; }
            {
              name = "buffer";
              keyword_length = 3;
            }
            { name = "path"; }
          ];
          mapping = {
            "<C-Space>" = "cmp.mapping.complete()";
            "<C-d>" = "cmp.mapping.scroll_docs(-4)";
            "<C-e>" = "cmp.mapping.close()";
            "<C-f>" = "cmp.mapping.scroll_docs(4)";
            "<CR>" = "cmp.mapping.confirm({ select = true })";
            "<S-Tab>" =
              "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
            "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
          };
        };
      };

      none-ls = {
        enable = true;
        sources = {
          diagnostics = {
            yamllint.enable = true; # yaml
            codespell.enable = true; # english
            pylint = {
              enable = true;
              package = null;
            };
          };
          formatting = {
            black = {
              enable = true;
              settings = { };
            }; # python
            isort = {
              enable = true;
              settings = { };
            }; # python
            nixfmt.enable = true; # nix
            yamlfmt.enable = true; # yaml
            codespell.enable = true; # english
            shfmt.enable = true; # bash
          };
        };
      };
    };

    keymaps = [
      # - Open error in floating windown
      {
        mode = "n";
        key = "<space>e";
        action.__raw = "vim.diagnostic.open_float";
      }
      # - Go to prev error
      {
        mode = "n";
        key = "[d";
        action.__raw = "vim.diagnostic.goto_prev";
      }
      # - Go to next error
      {
        mode = "n";
        key = "]d";
        action.__raw = "vim.diagnostic.goto_next";
      }
      # - Activate all formatters to format current file
      {
        mode = "n";
        key = "<leader>fa";
        action = "<cmd>lua vim.lsp.buf.format({async = true})<CR>";
      }
    ];
  };
}
