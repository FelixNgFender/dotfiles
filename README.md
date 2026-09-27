# My config files

## Quick start

If on Debian, install mise, Homebrew, keyd, then do this:

```shell
chmod u+x ./*.sh
./install.sh
```

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
