# if not running interactively, don't do anything
[[ $- != *i* ]] && return

# history
HISTSIZE=20000
HISTFILESIZE=20000
HISTCONTROL=ignoreboth

# options
shopt -s histappend
shopt -s checkwinsize
shopt -s cdspell
stty -ixon

# fixing autocomplete
bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'

## aliases
# doas
alias sudo='doas '
alias sudoedit='doas $EDITOR '
alias doasedit='doas $EDITOR '
# xbps
alias xi='doas xbps-install'
alias xr='doas xbps-remove'
alias xo='doas xbps-remove -o'
alias xq='xbps-query'
# files
alias mkdir='mkdir -vp'
alias rm='rm -vi'
alias rmf='rm -vrf'
alias mv='mv -vi'
alias cp='cp -vi'
alias ln='ln -vi'
# navigation
alias dl='cd -'
alias d1='cd ..'
alias d2='cd ../..'
alias d3='cd ../../..'
# listing
alias ll='ls -lhGF --si --color=auto --group-directories-first'    # long
alias lla='ls -lhAGF --si --color=auto --group-directories-first'  # long w/ .
alias ls='ls --color=auto --group-directories-first'               # grid
alias lsa='ls -A --color=auto --group-directories-first'           # grid w/ .
# misc and abbriviation
alias nnn='n3'
alias grep='grep --color=auto'
alias n='nano'
alias bc='bc -q'
alias wtest='ping -c 8 fsf.org'
alias wttr='curl wttr.in'
alias сдуфк='clear'
# config shortcuts
alias cfsh='$EDITOR $HOME/.bashrc && source $HOME/.bashrc'
alias cfpr='$EDITOR $HOME/.bash_profile'
alias cfbs='$EDITOR $HOME/.config/bspwm/bspwmrc'
alias cfsx='$EDITOR $HOME/.config/sxhkd/sxhkdrc'
alias cfna='$EDITOR $HOME/.config/nano/nanorc'
alias cflb='$EDITOR $HOME/.local/bin/bar.sh'
# poweroff
alias shd='doas poweroff'
alias rbt='doas reboot'

## prompt style
PS1="\[\033[0;33m\]\w\[\033[0m\]\n> "
PS2="> "

## window title
# set title to _user@host: wd_
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;bash: \w\a\]$PS1" ;;
esac
# set title to running command,
# e. g. _htop_ when running htop
set_title()
{
   local cmd=$BASH_COMMAND
   case "$cmd" in
   fg) cmd=$(jobs %); cmd=${cmd##"${cmd%  *}  "} ;;
   fg\ *|%*) cmd=$(jobs "${cmd#fg }"); cmd=${cmd##"${cmd%  *}  "} ;;
   esac
   printf "\e]2;%s\e\\" "${cmd//[$'\e\a']/#}"
}
trap set_title DEBUG

# clear the screen
clear
