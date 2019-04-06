# ~/.bashrc.d/aliases.sh
#
# Perfect alias candidates are one liners or functions that take no arguments.

if [ -x "$(which dircolors 2> /dev/null)" ]; then
    # Color support
    test -r ~/.bashrc.d/colors.sh && eval "$(dircolors -b ~/.bashrc.d/colors.sh)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto --group-directories-first'
    alias la='ls --all --human-readable --color=auto --group-directories-first'
    alias ll='ls -l --all --human-readable --color=auto --group-directories-first'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto -in'
    alias egrep='egrep --color=auto'
    alias fgrep='fgrep --color=auto'
else
    alias ls='ls --group-directories-first'
    alias la='ls --all --human-readable --group-directories-first'
    alias ll='ls -l --all --human-readable --group-directories-first'
    alias grep='grep -in'
fi

alias du='du -h'
alias duthis='du -h --max-depth=1 | sort -hr|head'
alias df='df -h'

# Package Search, Install, Remove
# Distro Update, Upgrade, Cleanup
if [[ -n $(which emerge 2> /dev/null) ]]; then
    alias ossearch='emerge -s' osinstall='sudo emerge -av' osremove='sudo emerge -avC'
    alias osupdate='sudo emerge --sync' osupgrade='sudo emerge -avuND --with-bdeps=y @world' oscleanup='sudo emerge --ask --depclean'
elif [[ -n $(which pacman 2> /dev/null) ]]; then
    alias ossearch='pacman -Ss' osinstall='sudo pacman -S' osremove='sudo pacman -R'
    alias osupdate='sudo pacman -Sy' osupgrade='sudo pacman -Syu' oscleanup='sudo pacman -Rsn'
elif [[ -n $(which apt-get 2> /dev/null) ]]; then
    alias ossearch='apt search' osinstall='sudo apt-get install --install-suggests' osremove='sudo apt-get premove --purge'
    alias osupdate='sudo apt-get update' osupgrade='sudo apt-get dist-upgrade' oscleanup='sudo apt-get autoremove'
elif [[ -n $(which zypper 2> /dev/null) ]]; then
    alias ossearch='zypper search' osinstall='sudo zypper install' osremove='sudo zypper remove --clean-deps'
    alias osupdate='sudo zypper refresh' osupgrade='sudo zypper update' oscleanup='sudo zypper rm -u'
elif [[ -n $(which yum 2> /dev/null) ]]; then
    alias ossearch='yum search' osinstall='sudo yum install' osremove='sudo yum remove'
    alias osupdate='sudo yum check-update' osupgrade='sudo yum update' oscleanup='sudo yum autoremove'
fi

# Mount
alias mntc='sudo mount -t auto /dev/sdc1 /mnt/thumb'
alias mntd='sudo mount -t auto /dev/sdd1 /mnt/thumb'
alias mnte='sudo mount -t auto /dev/sde1 /mnt/thumb'
alias mntf='sudo mount -t auto /dev/sdf1 /mnt/thumb'

# PC
alias halt='sudo shutdown -h' # Use with "now", "HH:MM" or any other valid (by shutdown) TIME construct.
alias reboot='sudo shutdown -r' # as above

# Midnight Commander Safe Terminal
# alias mcst='mc -a' # In case of malconfigured terminals
alias mc='. /usr/share/mc/mc-wrapper.sh'

# URxvt transparency
alias urxvt='urxvt -depth 32 -bg rgba:0000/0000/0000/aaaa'

# Emacs alias
alias ex='emacs' # EmaX
alias exnx='emacs -nw' # EmaX No X11
# emacsclient
alias ec='emacsclient -c' # EmacsClient
alias ecnx='emacsclient -t' # EmacsClient No X11 # No use for -a switch as we exported ALTERNATE_EDITOR in variables
alias eckd='emacsclient -e "(kill-emacs)"' # EmacsClient Kill Daemon # Kill an emacs --daemon gracefully

# calendar
alias cal='cal -m' # First Day Monday Calendars

# cloc
alias cloc='cloc --by-file-by-lang'

# NET
alias fixnet='ping -c 1 www.gentoo.org||sudo rc-service dhcpcd restart'

# Help wan-ip-howto
alias wip4='curl ipv4.whatismyip.akamai.com;echo'
alias wip6='curl ipv6.whatismyip.akamai.com;echo'

# ReMove Dead Links from current directory
alias rmdl='find -L . -name . -o -type d -prune -o -type l -exec rm -i {} +'

# Math time tables
alias propaideia='for a in {1..9}; do for b in $(seq 1 $a); do printf "%dx%d=%2d\t" $b $a $((b*a));done;printf "\n";done'
alias ttt='for a in {1..10}; do let tt="${a} * 10";for b in $(seq $a $a $tt);do printf "%4d" $b;done; printf "\n";done'

# https://twitter.com/liamosaur/status/506975850596536320
# alias fuck='sudo $(history -p \!\!)'

# https://gist.github.com/seungwon0/802470
# curl -s http://whatthecommit.com | perl -p0e '($_)=m{<p>(.+?)</p>}s'
# curl -L -s http://whatthecommit.com/ | grep -A 1 "\"c" | tail -1 | sed 's/<p>//'
# curl -s http://whatthecommit.com/index.txt

# GIT
# alias gcl='git clone'
# alias gfc='git fetch'
alias gst='git status'
# alias gdf='git diff'
# alias gaa='git add --all'
alias gad='git add .'
#alias gcm='git commit -m "$(curl -s http://whatthecommit.com/index.txt)"'
alias gcm='git commit -m "$(wget -q -O - http://whatthecommit.com/index.txt)"'
alias gps='git push'
alias glp='git log -p'
alias glg='git log --graph --pretty="%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'
# alias gco='git checkout'
# alias gpl='git pull --rebase'
# alias grb='git rebase'
