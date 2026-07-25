{ config, pkgs, ... }:

{
  home.username = "gabriel";
  home.homeDirectory = "/home/gabriel";

  home.stateVersion = "26.05";

  programs.home-manager.enable = true;

  programs.pay-respects = {
    enable = true;
    enableZshIntegration = true;
  };

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
}
