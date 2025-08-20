#!/usr/bin/env bash

stow bash
stow ghostty
stow git
# tells stow to symlink to '/' instead of '..'
sudo stow -t / keyd
stow mise
stow nvim
stow rclone
stow starship

sudo keyd reload
