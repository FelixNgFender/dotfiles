#!/usr/bin/env bash

brew install stow

stow bash
chmod u+x ~/.local/bin/nsys_easy.sh
stow brew
brew bundle --file ~/.Brewfile

stow ghostty
stow git
# tells stow to symlink to '/' instead of '..'
sudo stow -t / keyd
stow leetcode
stow mise
stow nvim
stow opencode
stow starship
gshortcuts import gnome-shortcuts.yaml

sudo keyd reload
