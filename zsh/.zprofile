[[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]] && exec startx
source $HOME/.cargo/env
