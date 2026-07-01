# My config files

## Quick start

Install Homebrew and various Amazon stuff then do this:

```shell
chmod u+x ./*.sh
./install.sh
```

## Standalone apps

### Misc

tailscale

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
