#!/usr/bin/env zsh

SERVICE="llama-cpp-fim.service"

systemctl --user daemon-reload
systemctl --user restart "$SERVICE"
