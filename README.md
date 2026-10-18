# NixOS Configuration

## Applying

Clone the repository into your NixOS setup. 

>![NOTE]
> It is recommended to clone into a repository such as `~/.config/nixos-config`
> to ensure you can edit and maintain the configuration with Git without
> requiring sudo mode.
>
> To apply changes, use:
> ```sh
> sudo nixos-rebuild switch --flake "$HOME/.config/nix-config#$(whoami)"
> ```
