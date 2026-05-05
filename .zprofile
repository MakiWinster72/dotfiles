# export QT_QPA_PLATFORMTHEME="qt6ct"
export QT_QPA_PLATFORM=wayland
# export XDG_CURRENT_DESKTOP=KDE
export KDE_SESSION_VERSION=6

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export INPUT_METHOD=fcitx
export SDL_IM_MODULE=fcitx
export GLFW_IM_MODULE=ibus
export NO_PROXY=maki,localhost,master,192.168.1.0/24,172.20.10.0/28

# Proxy rust
export RUSTUP_UPDATE_ROOT=https://mirrors.aliyun.com/rustup/rustup
export RUSTUP_DIST_SERVER=https://mirrors.aliyun.com/rustup
# goproxy
export GOPROXY="${GOPROXY:-https://goproxy.cn,direct}"
export GOSUMDB="${GOSUMDB:-off}"
export PATH="$HOME/go/bin:$PATH"
# JAVA
export JAVA_HOME=/usr/lib/jvm/java-21-openjdk
export PATH=$JAVA_HOME/bin:$PATH
# Node.js / NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"

export EDITOR="nvim"
export FREERDP_COMMAND="xfreerdp3"
export BROWSER="/usr/bin/zen-browser"
# XDG_MENU_PREFIX=arch- kbuildsycoca6
# export http_proxy="http://127.0.0.1:7897"
# export https_proxy="http://127.0.0.1:7897"
# export all_proxy="socks5://127.0.0.1:7897"
export PATH="$HOME/.npm-global/bin:$PATH"
export MANPAGER="sh -c 'col -bx | bat -l man'"
export PATH="$HOME/.local/bin:$PATH"

