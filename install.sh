#!/usr/bin/env bash

set -eou pipefail

sudo apt install stow
stow -t ~ brew
brew bundle --file ~/.Brewfile

stow -t ~ bash
stow -t ~ git
stow -t ~ ghostty
stow -t ~ mise
stow -t ~ nvim
stow -t ~ opencode
stow -t ~ starship
stow -t ~ tmux
stow -t ~ systemd
sudo stow -t / ssh
sudo stow -t / keyd
gshortcuts import gnome-shortcuts.yaml

mise install
sudo keyd reload
systemctl --user enable --now opencode-web
systemctl --user enable --now tmux
