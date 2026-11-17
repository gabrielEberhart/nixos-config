# NixOS Configuration

## Applying

1. Clone the repository into your NixOS setup.
2. Remove `hardware-config.nix` and replace it by using:
```sh
nixos-generate-config --show-hardware-config > /path/to/hardware-config.nix
```

The second step is necessary because NixOS gets mad at you when you don't
include `hardware-config.nix` in the Git repo. Thanks, Nix! :)

>![Note]
> It is recommended to clone into a repository such as `~/.config/nixos-config`
> to ensure you can edit and maintain the configuration with Git without
> requiring sudo mode.
>
> To apply changes, use:
> ```sh
> sudo nixos-rebuild switch --flake "$HOME/.config/nix-config#$(whoami)"
> ```
> 
> Alternatively, once the NixOS configuration has been setup, you can use the
> `update` alias.

## Machine-specific flake

While my NixOS config is personal, I do still use it across multiple machines.
However, these machines have specific needs.

`.gitignore` references a file `machine.flake`. The purpose of this flake is to
provide setup files for a specific machine that do not need to carry over to
another machine, and are better left out of the repo to avoid interacting with
other machines that run off the same config.
