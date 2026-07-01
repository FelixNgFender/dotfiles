autoload -Uz compinit
compinit

# devdesktop
export BRAZIL_WORKSPACE_DEFAULT_LAYOUT=short
export AUTO_TITLE_SCREENS="NO"
# if you wish to use IMDS set AWS_EC2_METADATA_DISABLED=false
export AWS_EC2_METADATA_DISABLED=true
export HOSTNAME_ALIAS=arm

export PATH=$HOME/.toolbox/bin:$PATH

# Added by AIM CLI
export PATH="$HOME/.aim/mcp-servers:$PATH"

export PATH=/usr/local/bin:$PATH

# uv
export PATH="$HOME/.local/bin:$PATH"
 
# expose mason lsps to cli
export PATH="$HOME/.local/share/nvim/mason/bin:$PATH"

# Editor used by CLI
export EDITOR="nvim"
export SUDO_EDITOR="$EDITOR"
export VISUAL="$EDITOR"

# set emacs mode for prompt, has to override $EDITOR
bindkey -e

# homebrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv zsh)"

# starship
eval "$(starship init zsh)"

# Set up mise for runtime management
eval "$(mise activate zsh)"

# uv
eval "$(uv generate-shell-completion zsh)"
eval "$(uvx --generate-shell-completion zsh)"
eval "$(ty generate-shell-completion zsh)"

# fzf
source <(fzf --zsh)

# zoxide
eval "$(zoxide init zsh)"

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# ALIASES
# file system
alias ls='eza -lh --group-directories-first --icons=auto'
alias lsa='ls -a'
alias lt='eza --tree --level=2 --long --icons --git'
alias lta='lt -a'
alias ff="fzf --preview 'bat --style=numbers --color=always {}'"
alias cd="zd"
zd() {
  if [ $# -eq 0 ]; then
    builtin cd ~ && return
  elif [ -d "$1" ]; then
    builtin cd "$1"
  else
    z "$@" && printf "\U000F17A9 " && pwd || echo "Error: Directory not found"
  fi
}
n() { if [ "$#" -eq 0 ]; then nvim .; else nvim "$@"; fi; }
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}
alias cat='bat'
alias find='fd'
alias du='dust'
alias ps='procs'
alias top='btop'

# directories
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# tools
alias g='git'
alias d='docker'
alias lzg='lazygit'
alias lzd='lazydocker'
alias pn='pnpm'
alias av='source .venv/bin/activate'
compress() { tar -czf "${1%/}.tar.gz" "${1%/}"; }
alias decompress="tar -xzf"

# git
alias gcm='git commit -m'
alias gcam='git commit -a -m'
alias gcad='git commit -a --amend'
alias gl='git log'
alias gco='git checkout'

# docker
alias dc='docker compose'
alias dcu='docker compose up -d'
alias dcd='docker compose down'

# brew
alias brewup='brew update; brew upgrade; brew cleanup; brew doctor'

# mwinit
alias mwinit='/usr/bin/mwinit -o'

# brazil
source "$HOME/.brazil_completion/zsh_completion"
alias bb='brazil-build'
alias bba='brazil-build apollo-pkg'
alias bre='brazil-runtime-exec'
alias bws='brazil ws'
alias bwsuse='bws use -p'
alias bwscreate='bws create -n'
alias brc='brazil-recursive-cmd'
alias bbr='brc brazil-build'
alias bball='brc --allPackages'
alias bbb='brc --allPackages brazil-build'
alias bbra='bbr apollo-pkg'
 
# finch
alias finch='sudo HOME=/home/thinhngn DOCKER_CONFIG=/home/thinhngn/.docker finch'

# Auto-start tmux on interactive SSH connections
if [[ -n "$PS1" ]] && [[ -n "$SSH_CONNECTION" ]] && [[ -z "$TMUX" ]]; then
  tmux attach-session -t "$HOSTNAME_ALIAS" || tmux new-session -s "$HOSTNAME_ALIAS"
  exit
fi
