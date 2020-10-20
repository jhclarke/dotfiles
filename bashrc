#
# ~/.bashrc
#
screenfetch
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '


#################
### SHORTCUTS ###
#################

# Bash Shortcuts
#-----------------
alias pbash='cat ~/.bash_profile'
alias jt='joplin-term'
alias jd='joplin-desktop'
alias mountbox='rclone mount boxremote: ~/alab/box/alab_box --vfs-cache-mode writes --dir-cache-time 30s --cache-dir ~/alab/box/.cache --poll-interval 5s'
alias unmountbox='fusermount -uz ~/alab/box/alab_box'
alias open='xdg-open '
alias blth='bluetoothctl '
alias vim='nvim '
alias SE='sudo -E nvim '

# VPN Shortcuts
alias gohome='sudo openvpn --config /etc/openvpn/client.ovpn'
alias gospt='systemctl --user restart spotifyd && spt'
alias sysupdate='cd ~/.scripts && . update.sh'

# Python/Research Shortcuts
#-----------------
alias jn='jupyter notebook '
alias jqt='jupyter qtconsole & '
alias pyenv_main='cd /usr/pyenvs && source main/bin/activate '
alias cdbio='cd ~/alab/box/alab_box/SPIM/modeling/biobeam/python/py/ '
alias gotexas='sudo openconnect -u `gnome-keyring-query get eid`  vpn.utexas.edu'
alias rdalab-full='xfreerdp /u:`gnome-keyring-query get eid` /v:`gnome-keyring-query get alabip` /workarea -f'
alias rdalab='xfreerdp /u:`gnome-keyring-query get eid`  /v:`gnome-keyring-query get alabip`'

## Virtual Environments
#----------------------
#Virtualenvwrapper settings:
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/bin/virtualenv
source ~/.local/bin/virtualenvwrapper.sh

# VM Shortcuts
#-----------------
alias vmw1='VBoxManage startvm 'Windows1' '

# Git Aliases
#-----------------
alias gstat='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit '
alias gcm='git commit -m '
alias gpcred='git config credential.helper store && git push -u origin master '
alias gpom='git push -u origin master '
alias gp='git push '
alias gd='git diff '
alias gco='git checkout '
alias glog='git log --oneline --graph'
alias gk='gitk --all&'
alias gx='gitx --all'
alias got='git '
alias get='git '

export EDITOR='vim'


#---------------------
# OFX + Ledger Finances
#---------------------
export GLOBAL_PYTHON=/usr/bin/python3
#source ~/.scripts/ofx2csv.py

# Powerline
#-----------------
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /usr/share/powerline/bindings/bash/powerline.sh
