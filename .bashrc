#############
# ~/.bashrc
#############

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Exports
export PATH=$PATH:/home/kappa/.spicetify

export EDITOR='/.local/bin/bin/nvim'
export VISUAL='/.local/bin/bin/nvim'
 #Alias
 

alias ..='cd ..'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias df='df -h'
alias free='free -m'
alias confBspwm='nvim $HOME/.config/bspwm/bspwmrc'
alias test='echo test'
alias yaysyu='yay -Syu --noconfirm'              # update standard pkgs and AUR pkgs (yay)
alias pacsyu='sudo pacman -Syu'                  # update only standard pkgs
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)' # remove orphaned packages
alias ls='exa --icons'
alias ll='exa --icons --long'
alias la='exa --icons --all'
alias onBluetooth='sudo systemctl start bluetooth'
alias onHTTP='python -m http.server'
alias shutdown='shutdown -h now'
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Setting up colors
BLACK="\[\e[30m\]"
LIGHT_BLACK="\[\e[90m\]"
RED="\[\e[31m\]"
LIGHT_RED="\[\e[91m\]"
GREEN="\[\e[32m\]"
LIGHT_GREEN="\[\e[92m\]"
YELLOW="\[\e[33m\]"
LIGHT_YELLOW="\[\e[93m\]"
BLUE="\[\e[34m\]"
LIGHT_BLUE="\[\e[94m\]"
PURPLE="\[\e[35m\]"
LIGHT_PURPLE="\[\e[95m\]"
CYAN="\[\e[36m\]"
LIGHT_CYAN="\[\e[96m\]"
GRAY="\[\e[37m\]"
LIGHT_GRAY="\[\e[97m\]"

# Reseting
RESET="\[\e[0m\]"
DEFAULT="\[\e[39\]"

### Minimalist but featurefull prompt
# Command to set color if precedent command fail
set_prompt(){
    # check if last command succed or failed
    if [ $? = 0 ]; then
        CMD_OUT_COLR=$GREEN
        GUY='[◝(ᵔᵕᵔ)◜]'
    else
        CMD_OUT_COLR=$RED
        GUY='[(˃̣̣̥ᴖ˂̣̣̥)]'
    fi

    # check if we are inside an ssh session
    if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
        SSH_COLR=$YELLOW
    else
        SSH_COLR=''
    fi

    # check if logged as root, and if not, can sudo
    if [ $(id -u) = 0 ]; then
        USER_COLR=$RED
    else
        if id -nG $(whoami) | grep -qw "sudo" || id -nG $(whoami) | grep -qw "wheel"; then
            USER_COLR=$BLUE
        else
            USER_COLR=''
        fi
    fi

    PS1="$CYAN\w$RESET $BOLD$USER_COLR>$RESET$BOLD$SSH_COLR>$RESET$BOLD$CMD_OUT_COLR$GUY$RESET "
}

PROMPT_COMMAND=set_prompt

[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

pfetch
#colorscript -r

# HSTR configuration - add this to ~/.bashrc
alias hh=hstr                    # hh to be alias for hstr
export HSTR_CONFIG=hicolor       # get more colors
shopt -s histappend              # append new history items to .bash_history
export HISTCONTROL=ignorespace   # leading space hides commands from history
export HISTFILESIZE=10000        # increase history file size (default is 500)
export HISTSIZE=${HISTFILESIZE}  # increase history size (default is 500)
# ensure synchronization between bash memory and history file
export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"
# if this is interactive shell, then bind hstr to Ctrl-r (for Vi mode check doc)
if [[ $- =~ .*i.* ]]; then bind '"\C-r": "\C-a hstr -- \C-j"'; fi
# if this is interactive shell, then bind 'kill last command' to Ctrl-x k
if [[ $- =~ .*i.* ]]; then bind '"\C-xk": "\C-a hstr -k \C-j"'; fi

