# Pkgs for development
{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # Rust
    cargo
    rustc
    rustfmt
    rustup
    rust-analyzer

    # C/C++
    clang
    clang-tools

    # Lua
    stylua
    lua-language-server

    # NodeJS
    nil
    nixfmt-rfc-style
    nodejs

    # Zig
    zig
  ];
}
