#!/usr/bin/env bash

stow brew
brew bundle --file ~/.Brewfile

stow bash
stow git
stow mise
stow nvim
stow opencode
stow starship
stow tmux

mise install
systemctl --user restart opencode-web
