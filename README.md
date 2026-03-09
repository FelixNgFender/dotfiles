# My config files

## Quick start

If on Ubuntu, install Omakub. Then install Ghostty, gshortcuts, and Homebrew,
then do this:

```shell
chmod u+x ./*.sh
./install.sh
```

## Standalone apps

### Music

reaper, neural dsp, yabridge, bunch of other VSTs i think.

### Video

kdenlive

### GPU programming

cuda toolkit

### Gaming

sunshine, moonlight

### Misc

fcitx5 (for keyboards), wmctrl, keyd, globalprotect

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
