# fcitx input framework for vietnamese and chinese inputs
export XMODIFIERS=@im=fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx

# adb
if [ -d "$HOME/.adb-fastboot/platform-tools" ]; then
  export PATH="$HOME/.adb-fastboot/platform-tools:$PATH"
fi
