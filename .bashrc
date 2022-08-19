#
# ~/.bashrc
#
screenfetch -N

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# Auto Load gnome-keyring daemon on bash session
#------------------------------------------------
if [ -n "$DESKTOP_SESSION" ];then
    eval $(gnome-keyring-daemon --start)
    export SSH_AUTH_SOCK
fi

export LD_LIBRARY_PATH=/opt/OpenBLAS/lib:$LD_LIBRARY_PATH

# Terminal to kitty
# source <(kitty + complete setup bash)
# export TERMINAL="kitty"

# # Fish
# # drop into fish if parent process is NOT fish
# # invoke `bash` from fish with `bash` (sources `~/.bashrc`)
# if [[ $(ps --no-header --pid=$PPID --format=cmd) != "fish" ]]
# then
#   exec fish
# fi

alias python3.8='/usr/bin/python3.8'
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
alias k='kill '
alias ka='killall '
alias todo='vim ~/TODO.md'
alias cdlls='cd ~/Documents/LLS '

# VPN/VNC Shortcuts
#------------------
alias gohome='sudo openvpn --config /etc/openvpn/client.ovpn'
alias gomac='remmina -c ~/.local/share/remmina/remotes_vnc_mbp-ag_192-168-1-113.remmina'
alias gospt='systemctl --user restart spotifyd && spt'
alias sysupdate='cd ~/.scripts && . update.sh'
alias gowin-full='xfreerdp /u:"`gnome-keyring-query get winusn`" /v:`gnome-keyring-query get winip` /workarea -f'
alias gowin='xfreerdp /u:"`gnome-keyring-query get winusn`"  /v:`gnome-keyring-query get winip`'
alias gowmac-full='xfreerdp /u:"`gnome-keyring-query get wmacusn`" /v:`gnome-keyring-query get wmacip` /workarea -f'
alias gowmac='xfreerdp /u:"`gnome-keyring-query get wmacusn`" /v:`gnome-keyring-query get wmacip`'


# ProtonVPN
alias pvpn='sudo protonvpn '
alias pvpnsecure='sudo protonvpn c --sc -p tcp'
alias pvpnrand='sudo protonvpn c -r -p tcp'
alias pvpnupdate='sudo pip3 uninstall protonvpn-cli'

# Python/Research Shortcuts
#-----------------
alias jn='jupyter notebook '
alias jqt='jupyter qtconsole & '
alias pyenv_main='cd /usr/pyenvs && source main/bin/activate '
alias cdbio='cd ~/alab/box/alab_box/SPIM/modeling/biobeam/python/py/ '
alias cdmrsec='cd ~/alab/local/mrsec/'
alias gotexas='sudo openconnect -u `gnome-keyring-query get eid`  vpn.utexas.edu'
alias rdalab-full='xfreerdp /u:`gnome-keyring-query get eid` /v:`gnome-keyring-query get alabip` /workarea -f'
alias rdalab='xfreerdp /u:`gnome-keyring-query get eid`  /v:`gnome-keyring-query get alabip`'
alias rdspim-full='xfreerdp /u:"`gnome-keyring-query get spimusn`" /v:`gnome-keyring-query get spimip` /workarea -f'
alias rdspim='xfreerdp /u:"`gnome-keyring-query get spimusn`"  /v:`gnome-keyring-query get spimip`'
alias rdepi-full='xfreerdp /u:"`gnome-keyring-query get epiusn`" /v:`gnome-keyring-query get epiip` /workarea -f'
alias rdepi='xfreerdp /u:"`gnome-keyring-query get epiusn`"  /v:`gnome-keyring-query get epiip`'


# alias mount_mrsecbox='rclone mount mrsec_boxremote: ~/alab/box/alab_mrsec_box --vfs-cache-mode writes --dir-cache-time 30s --cache-dir ~/alab/box/mrsec/.cache --poll-interval 5s'
# alias unmount_mrsecbox='fusermount -uz ~/alab/box/alab_mrsec_box'


# Documents
#-----------------
alias pandoc_jc='pandoc -f markdown -V linkcolor:blue --pdf-engine=xelatex -t pdf -s '


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

# SSH
alias gkinto='eval "$(ssh-agent -s)" && ssh-add -D && ssh-add /home/agathos/.ssh/id_rsa_kinto < /dev/null'
alias gjc='eval "$(ssh-agent -s)" && ssh-add -D && DISPLAY=1 SSH_ASKPASS=/home/agathos/.ssh/paa/jc ssh-add /home/agathos/.ssh/id_rsa < /dev/null'
alias goinos='eval "$(ssh-agent -s)" && ssh-add -D && DISPLAY=1 SSH_ASKPASS=/home/agathos/.ssh/paa/oinos ssh-add /home/agathos/.ssh/id_rsa_oinos < /dev/null'
alias gut='eval "$(ssh-agent -s)" && ssh-add -D && DISPLAY=1 SSH_ASKPASS=/home/agathos/.ssh/paa/ut ssh-add /home/agathos/.ssh/id_rsa_ut < /dev/null'
alias glls='eval "$(ssh-agent -s)" && ssh-add -D && ssh-add /home/agathos/.ssh/id_rsa_lls < /dev/null'

# xbox
alias xboxoff='xbox-cli poweroff'
alias xboxon='xbox-cli poweron --liveid FD0001B5C6D173A7'

export EDITOR='nvim'

# Helpers
# ---------------
alias checkserv='sudo journalctl -f -u '
alias fixdisplay='export DISPLAY=:0'
# find-in-file - usage: fif <searchTerm> CREDIT: https://github.com/junegunn/fzf/wiki/Examples#searching-file-contents
function fif() {
  if [ ! "$#" -gt 0 ]; then echo "Need a string to search for!"; return 1; fi
  rg --files-with-matches --no-messages "$1" | fzf --preview "highlight -O ansi -l {} 2> /dev/null | rg --colors 'match:bg:yellow' --ignore-case --pretty --context 10 '$1' || rg --ignore-case --pretty --context 10 '$1' {}"
}

function docx_search() {
  local arg wordfile terms=() root=${root:-/}
  # this 'root' assignment allows you to search in a specific location like /cygdrive/c/ instead of everywhere on the machine
  for arg; do terms+=(-e "$arg"); done
  # We inject the terms to search inside the string with declare -p`
  find 2>/dev/null "${root%/}/" -iname '*.docx' -exec \
    bash -c "$(declare -p terms)"';
      for arg; do
        unzip -p "$arg" 2>/dev/null |
          grep --quiet --ignore-case --fixed-strings "${terms[@]}" &&
          printf %s\\n "$arg"
      done' _ {} +
}

#---------------------
# OFX + Ledger Finances
#---------------------
# export GLOBAL_PYTHON=/usr/bin/python3

# Powerline
#-----------------
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /usr/share/powerline/bindings/bash/powerline.sh

# RUBY settings were changed with RVM install instructions
# Install Ruby Gems to ~/gems
# export GEM_HOME="$HOME/gems"
# export PATH="$HOME/gems/bin:$PATH"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# bitwarden


# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
# RVM bash completion
[[ -r "$HOME/.rvm/scripts/completion" ]] && source "$HOME/.rvm/scripts/completion"


# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION
