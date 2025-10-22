# My config files

## Quick start

If on Ubuntu, install Omakub. Then install Ghostty, starship, and Homebrew, then
do this:

```shell
chmod u+x ./install.sh
./install.sh
```

## Enable rclone systemd service

```shell
systemctl --user daemon-reload
systemctl --user enable --now rclone.{timer,path,service}
```

## Standalone apps

### AI

opencode

### Music

reaper, neural dsp, yabridge, bunch of other VSTs i think.

### Video

kdenlive

### GPU programming

nvtop, cuda toolkit

### Hacking

ghidra, wireshark

### Gaming

sunshine, moonlight

### Misc

adb (android debug), fcitx5 (for keyboards), websocat (for typst-preview),
wmctrl, keyd, rclone, globalprotect

## How stow works

```shell
# example
$ stow vim

/Users/alice
├── .dotfiles
│   ├── vim
│       └── .vimrc
│       └── .vim
|       └── script.vim
├── .vimrc -> .dotfiles/vim/.vimrc
├── .vim   -> .dotfiles/vim/.vim
|   └── script.vim
```
