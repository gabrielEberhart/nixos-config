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
