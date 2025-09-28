source ~/.local/share/omakub/defaults/bash/rc

# Editor used by CLI
export EDITOR="nvim"
export SUDO_EDITOR="$EDITOR"
. "$HOME/.cargo/env"

# yabridge
export PATH="$PATH:$HOME/.local/share/yabridge"

if [ -f ~/.bash_aliases ]; then
  source ~/.bash_aliases
fi

# homebrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# cuda toolkit
export PATH=/usr/local/cuda-12.4/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda-12.4/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

# yazi
function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    builtin cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# uv
eval "$(uv generate-shell-completion bash)"
eval "$(uvx --generate-shell-completion bash)"

# starship
eval "$(starship init bash)"
