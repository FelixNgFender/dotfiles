#!/usr/bin/env zsh

brew bundle --file brew/.Brewfile

stow -t ~ brew
stow -t ~ ghostty
stow -t ~ git
stow -t ~ karabiner
stow -t ~ launchd
stow -t ~ mise
stow -t ~ nvim
stow -t ~ starship
stow -t ~ tmux
stow -t ~ zsh

source ~/.zshrc
