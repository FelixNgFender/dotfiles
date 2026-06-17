# File system
alias ls='eza -lh --group-directories-first --icons=auto'
alias lsa='ls -a'
alias lt='eza --tree --level=2 --long --icons --git'
alias lta='lt -a'
alias ff="fzf --preview 'batcat --style=numbers --color=always {}'"
alias fd='fdfind'
# Only shadow cd with zoxide if it is actually installed
if command -v zoxide &>/dev/null; then
  alias cd=z
fi

# Directories
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Tools
n() { if [ "$#" -eq 0 ]; then nvim .; else nvim "$@"; fi; }
alias g='git'
alias d='docker'
alias bat='batcat'
alias lzg='lazygit'
alias lzd='lazydocker'

# Git
alias gcm='git commit -m'
alias gcam='git commit -a -m'
alias gcad='git commit -a --amend'

# pnpm
alias pn="pnpm"

# python
alias av="source .venv/bin/activate"

# docker
alias dc="docker compose"
alias dcu="docker compose up -d"
alias dcd="docker compose down"

# brew
alias brewup='brew update; brew upgrade; brew cleanup; brew doctor'

# copying
alias copy='xclip -selection clipboard'

# opencode
alias oca="opencode attach http://localhost:4096 --dir ."

# compression
compress() { tar -czf "${1%/}.tar.gz" "${1%/}"; }
alias decompress="tar -xzf"
