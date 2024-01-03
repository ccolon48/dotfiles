# .bash_profile

# get configs
if [ -f $HOME/.bashrc ] ; then
    source $HOME/.bashrc
fi

## variables
export PATH=/home/ccolon/.local/bin:/usr/local/sbin:/usr/local/bin
export PATH="$PATH":/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/opt
export TERM='rxvt-unicode'
export MANPAGER='less'
export VISUAL='nano'
export EDITOR='nano'
export TERMINAL='urxvtc'
export FILEMANAGER='nnn'
export BROWSER='firefox'
export VIDIO='mpv'
export AUDIO='mpv'
export IMAGE='feh'
export DOCUMENT='zathura'
export LESSHISTFILE=-
export GTK2_RC_FILES="$HOME"/.config/gtk-2.0/gtkrc
