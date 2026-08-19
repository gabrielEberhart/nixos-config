{ config, pkgs, ... }:

{
  home.username = "gabriel";
  home.homeDirectory = "/home/gabriel";

  home.stateVersion = "26.05";

  # Environment Variables
  home.sessionVariables = {
    DISABLE_MASON = "1";
  };

  ############
  # PROGRAMS #
  ############
  programs.home-manager.enable = true;

  # Pay-Respects (replacement for thefuck)
  programs.pay-respects = {
    enable = true;
    enableZshIntegration = true;
  };

  # Github
  programs.gh = {
    enable = true;
    gitCredentialHelper = {
      enable = true;
    };
    settings = {
      git_protocol = "ssh";
      editor = "nvim";
    };
  };

  # Ghostty
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;

    settings = {
      theme = "Catppuccin Mocha";
      background-opacity = "0.95";
    };
  };

  # Zed editor
  programs.zed-editor = {
    enable = true;
    # Extensions
    extensions = [ "nix" "toml" "rust" "make" ];

    # Everything inside of these brackets are Zed options
    userSettings = {
      assisstant = {
        enabled = true;
        version = "2";
        default_open_ai_model = null;

        #  Provider options:
        # - zed.dev models (claude-3-5-sonnet-latest) requires GitHub connected
        # - anthropic models (claude-3-5-sonnet-latest, claude-3-haiku-latest, claude-3-opus-latest) requires API_KEY
        # - copilot_chat models (gpt-4o, gpt-4, gpt-3.5-turbo, o1-preview) requires GitHub connected
        default_model = {
          provider = "copilot_chat";
          model = "gpt-4o";
        };
      };
      auto_update = false;
      base_keymap = "VSCode";
      hour_format = "hour24";
      vim_mode = true;

      # Terminal settings
      terminal = {
        alternate_scroll = "off";
        blinking = "on";
        detect_venv = {
          on = {
            directories = [ ".env" "env" ".venv" "venv" ];
            activate_script = "default";
          };
        };
        toolbar = {
          title = "true";
        };
        shell = "system";
        working_directory = "current_project_directory";
      }; # End of terminal settings

      theme = {
        mode = "system";
        dark = "One Dark;
        light = "One Light";
      };
    }; # End of user settings
  };

  # Neovim (LazyVim config)
  # Since I already have a working cross-distro LazyVim config, we may as well
  # keep the files stored as-is rather than porting it "the Nix way". Still,
  # it is good practise to store the configuration files alongside the rest of
  # my system configuration.
  home.file.".config/nvim" = {
    source = ./home/nvim;
    recursive = true;
  };
}
