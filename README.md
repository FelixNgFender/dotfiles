# My config files

## Quick start

If on Ubuntu, install Omakub. Then install Ghostty and Homebrew, then do this:

```shell
chmod u+x ./install.sh
./install.sh
```

## Standalone apps

### Music

reaper, neural dsp, yabridge, bunch of other VSTs i think.

### Video

kdenlive

### GPU programming

nvtop, cuda toolkit

### Hacking

ghidra, wireshark

### Misc

rclone, globalprotect

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
