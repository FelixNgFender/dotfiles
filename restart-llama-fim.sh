#!/usr/bin/env zsh

PLIST="$HOME/Library/LaunchAgents/launched.llama_cpp_fim.plist"
LABEL="launched.llama_cpp_fim"

if launchctl list | grep -q "$LABEL"; then
  launchctl bootout "gui/$(id -u)" "$PLIST"
fi

launchctl bootstrap "gui/$(id -u)" "$PLIST"

