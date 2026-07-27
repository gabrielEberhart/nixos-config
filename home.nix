{ config, pkgs, ... }:

{
  home.username = "gabriel";
  home.homeDirectory = "/home/gabriel";

  home.stateVersion = "26.05";

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
  programs.ghostty {
    enable = true;
    enableZshIntegration = true;

    settings = {
      theme = "Catppuccin Mocha";
      background-opacity = "0.95";
    };
  };
}
