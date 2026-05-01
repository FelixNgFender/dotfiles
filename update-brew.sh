#!/usr/bin/env bash

brew bundle dump --file ./brew/.Brewfile --force
brewup
systemctl --user restart opencode-web
