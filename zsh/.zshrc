# Kiro CLI pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.pre.zsh"

export PATH=/usr/local/bin:$PATH
export PATH=$HOME/.toolbox/bin:$PATH

# Added by AIM CLI
export PATH="$HOME/.aim/mcp-servers:$PATH"

# Editor used by CLI
export EDITOR="nvim"
export SUDO_EDITOR="$EDITOR"

# starship
eval "$(starship init zsh)"

# homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Set up mise for runtime management
eval "$(mise activate zsh)"
source /Users/thinhngn/.brazil_completion/zsh_completion

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

# zotero
export ZOTERO_PATH="$HOME/Zotero"
export ZOTERO_BIB="$ZOTERO_PATH/library.bib"

# kiro
[[ "$TERM_PROGRAM" == "kiro" ]] && . "$(kiro --locate-shell-integration-path zsh)"

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

# Kiro CLI post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.post.zsh"
