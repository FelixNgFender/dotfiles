# Editor used by CLI
export EDITOR="nvim"
export SUDO_EDITOR="$EDITOR"

## SHELL
# append to the history file, don't overwrite it
shopt -s histappend

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=32768
HISTFILESIZE="${HISTSIZE}"

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Autocompletion
source /usr/share/bash-completion/bash_completion

# Set complete path
export PATH="$PATH:./bin:$HOME/.local/bin"
set +h

## INIT
# homebrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv bash)"

# mise
eval "$(mise activate bash)"

# cargo
. "$HOME/.cargo/env"

# expose mason lsps to cli
export PATH="$HOME/.local/share/nvim/mason/bin:$PATH"

## PROMPT
# Technicolor dreams
force_color_prompt=yes
color_prompt=yes

# Simple prompt with path in the window/pane title and caret for typing line
PS1=$'\uf0a9 '
PS1="\[\e]0;\w\a\]$PS1"

## RC

# Aliases
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

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
eval "$(ty generate-shell-completion bash)"

# fzf
eval "$(fzf --bash)"

# starship
eval "$(starship init bash)"

# zoxide
eval "$(zoxide init bash)"

# Auto-start tmux on interactive SSH connections
if [[ -n "$PS1" ]] && [[ -n "$SSH_CONNECTION" ]] && [[ -z "$TMUX" ]]; then
  tmux attach-session -t "$HOSTNAME" || tmux new-session -s "$HOSTNAME"
  exit
fi
