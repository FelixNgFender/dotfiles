source ~/.env
source ~/.local/share/omakub/defaults/bash/rc

# Editor used by CLI
export EDITOR="nvim"
export SUDO_EDITOR="$EDITOR"

# cargo
. "$HOME/.cargo/env"

# yabridge
export PATH="$PATH:$HOME/.local/share/yabridge"

if [ -f ~/.bash_aliases ]; then
  source ~/.bash_aliases
fi

# homebrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# cuda toolkit
export CUDA_HOME="/usr/local/cuda"
export PATH="$PATH:$CUDA_HOME/bin"
export LD_LIBRARY_PATH=${CUDA_HOME}/lib64:$LD_LIBRARY_PATH

# yazi
function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    builtin cd -- "$cwd" || exit
  fi
  rm -f -- "$tmp"
}

# yt-dlp
ytaudio() {
  yt-dlp -x --audio-format best "$@"
}

yt2demucs() {
  local url="$1"
  local stem="${2:-all}" # all | vocals | drums | bass | other
  local fmt="${3:-wav}"  # wav (recommended), flac, mp3
  if [[ -z "$url" ]]; then
    echo "Usage: yt2demucs <youtube_url> [stem] [format]"
    echo "Example: yt2demucs \"https://youtu.be/...\" vocals wav"
    return 1
  fi
  # download + extract audio
  yt-dlp -x --audio-format "$fmt" -o "%(title)s.%(ext)s" "$url" || return 1
  # resolve final downloaded filename
  local file
  file="$(yt-dlp --get-filename -o "%(title)s.%(ext)s" "$url")"
  file="${file%.*}.$fmt"
  if [[ ! -f "$file" ]]; then
    echo "Could not find downloaded file: $file"
    return 1
  fi
  # run demucs
  if [[ "$stem" == "all" ]]; then
    demucs --name htdemucs_6s "$file"
  else
    demucs --two-stems="$stem" "$file"
  fi
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
eval "$(ty generate-shell-completion bash)"

# fzf
eval "$(fzf --bash)"

# starship
eval "$(starship init bash)"

# leetcode-cli
export LEETCODE_CSRF=$LEETCODE_CSRF
export LEETCODE_SESSION=$LEETCODE_SESSION
eval "$(leetcode completions)"

# for use in nvim-zotcite
export ZOTERO_PATH=$ZOTERO_PATH
export ZOTERO_BIB=$ZOTERO_BIB

# huggingface
export HF_TOKEN=$HF_TOKEN
export HF_TOKEN_VASTAI=$HF_TOKEN_VASTAI
