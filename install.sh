#!/usr/bin/env zsh

brew bundle --file brew/.Brewfile

stow -t ~ brew
stow -t ~ git
stow -t ~ mise
stow -t ~ nvim
stow -t ~ starship
stow -t ~ systemd
stow -t ~ tmux
stow -t ~ zsh

source ~/.zshrc
