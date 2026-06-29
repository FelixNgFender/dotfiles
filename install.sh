#!/usr/bin/env zsh

brew install stow

stow brew
brew bundle --file ~/.Brewfile

stow ghostty
stow git
stow karabiner
stow mise
stow nvim
stow opencode
stow starship
stow tmux
stow zsh
