#!/usr/bin/env bash

set -eou pipefail

sudo apt install stow
stow -t ~ brew
brew bundle --file ~/.Brewfile

stow -t ~ bash
stow -t ~ git
stow -t ~ mise
stow -t ~ nvim
stow -t ~ opencode
stow -t ~ starship
stow -t ~ tmux
stow -t ~ systemd
sudo stow -t / ssh

mise install
systemctl --user enable --now opencode-web
systemctl --user enable --now tmux
