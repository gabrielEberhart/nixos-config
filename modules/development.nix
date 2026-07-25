# Pkgs for development
{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    cargo
    zig
    rustc
    rustfmt
    rustup
  ];
}
