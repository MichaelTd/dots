# ~/.bashrc.d/variables.bash
#
# environment variables
#shellcheck shell=bash

# Used by mc themes
export COLORTERM="truecolor"

# SUDO_ASKPASS
#shellcheck disable=SC2155
export SUDO_ASKPASS="$(type -P x11-ssh-askpass||type -P ssh-askpass-fullscreen)"

# Used by emacsclient in case of server not running.
#shellcheck disable=SC2155
export ALTERNATE_EDITOR="$(type -P emacs||type -P gvim||type -P kate||type -P gedit||type -P mousepad)" \
       TERMINAL_EDITOR="$(type -P emacs||type -P vim||type -P micro||type -P nano)"

export EDITOR="${TERMINAL_EDITOR}" VISUAL="${ALTERNATE_EDITOR}"

if [[ -n "${DISPLAY}" ]]; then
    #shellcheck disable=SC2155
    export BROWSER="$(type -P firefox ||type -P seamonkey)"
else
    #shellcheck disable=SC2155
    export BROWSER="$(type -P w3m||type -P links||type -P lynx)"
fi

# Colorfull manpages (works with less as a pager)
# https://www.tecmint.com/view-colored-man-pages-in-linux/
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

# most > less > more in order of preference
#shellcheck disable=SC2155
export PAGER="$(type -P most ||type -P less||type -P more)"

# manpager in case you'd like your manpages in your favorite editor
# export MANPAGER="env MAN_PN=1 vim -M +MANPAGER -"

export LANG="en_US.utf8"
export LC_COLLATE="C"

export GIT_PS1_SHOWDIRTYSTATE=yes
export GIT_PS1_SHOWSTASHSTATE=yes
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWUPSTREAM=yes

# OPT
export OPT="/opt"
export HOPT="${HOME}/opt"
# JAVA
export JAVA="/opt/java"
export JAVA_HOME="${JAVA}"
export ANT="/opt/ant"
export MAVEN="/opt/maven"
export GRADLE="/opt/gradle"
# GO
export GOPATH="${HOME}/go"
# NODE
export NODE="/opt/nodejs"
# MONGODB
export MONGODB="/opt/mongodb"

# Path with += op and each tool in it's own line for practical reasons
export PATH+=":${HOME}/.local/bin"
# OPT
export PATH+=":${OPT}/bin"
export PATH+=":${HOPT}/bin"
export PATH+=":${HOME}/bin"
# JAVA
export PATH+=":${JAVA_HOME}/bin"
export PATH+=":${ANT}/bin"
export PATH+=":${MAVEN}/bin"
export PATH+=":${GRADLE}/bin"
export PATH+=":${GOPATH}/bin"
# RUST
if [[ -d "${HOME}/.cargo" ]]; then
  export PATH+=":${HOME}/.cargo/bin"
fi
# NODE
export PATH+=":${NODE}/bin"
# MONGODB
export PATH+=":${MONGODB}/bin"

#MANPATH
export MANPATH+=":${HOME}/.local/share/man"
export MANPATH+=":${HOME}/opt/share/man"

# JAVA classpath
export CLASSPATH+=":${JAVA}/lib"
export CLASSPATH+=":${ANT}/lib"
export CLASSPATH+=":${MAVEN}/lib"
