# Office files. PDF viewers, Libreoffice suite, email, etc.
{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    libreoffice
    kdePackages.okular
  ];
}
