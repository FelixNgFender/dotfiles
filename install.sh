#!/usr/bin/env bash

set -eou pipefail

sudo apt install stow
stow brew
brew bundle --file ~/.Brewfile

stow bash
stow git
stow mise
stow nvim
stow opencode
stow starship
stow tmux
stow systemd
sudo stow -t / ssh

mise install
systemctl --user enable --now opencode-web
systemctl --user enable --now tmux
