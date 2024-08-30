#
# ~/.bash_profile
#
#=======================================================#

[[ -f ~/.bashrc ]] && . ~/.bashrc
 
#=======================================================#

#### SETTING UP APPS ####

export PATH=$PATH:/home/kappa/.spicetify

export EDITOR="nano"
export TERM="alacritty"
export BROWSER="firefox"
export LOCKER="slock"


#### Auto-starting X11 if at login ####

if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then
    exec startx
fi 

source /home/kappa/.config/broot/launcher/bash/br
