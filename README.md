# Dotfiles

This reposity use [chezmoi](https://www.chezmoi.io/) as the dotfile manager.

You can use `sh -c "$(curl -fsLS get.chezmoi.io)" -- init --ssh --apply Undefined01` to install the configs.

For NixOS, run `nix shell nixpkgs#{git,gnupg,chezmoi} -c chezmoi init --ssh --apply Undefined01`. (Maybe with `export {http_proxy,https_proxy,HTTP_PROXY,HTTPS_PROXY,all_proxy,ALL_PROXY}="http://<proxy>:<port>"`)

