#!/usr/bin/env bash

stow bash
chmod u+x ~/.local/bin/nsys_easy.sh
stow ghostty
stow git
# tells stow to symlink to '/' instead of '..'
sudo stow -t / keyd
stow leetcode
stow mise
stow nvim
stow rclone
stow opencode
stow starship
gshortcuts import gnome-shortcuts.yaml

sudo keyd reload
