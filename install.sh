#!/usr/bin/env zsh

brew install stow

stow brew
brew bundle --file ~/.Brewfile

stow ghostty
stow git
stow karabiner
stow mise
stow nvim
stow starship
stow tmux
stow zsh
stow launchd
