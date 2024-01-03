#! /bin/sh
# goofy lemonbar script for my bspwm setup

## date
c()
{
    date +"%a %d %b, %I:%M %P"
}

## battery
p()
{
    cat /sys/class/power_supply/BAT1/capacity
}

st()
{
    cat /sys/class/power_supply/BAT1/status
}

# bspwm space
sp()
{
    bspc query -D -d focused --names
}

# x window title or placeholder
xt()
{
    TITLE=$(xdotool getwindowfocus getwindowname)
    if [ "$TITLE" = "" ] ; then
        echo "What a nice day, $USER, isn't it?"
    else
        echo "$TITLE" | sed -E "s/(.{86}).*$/\1.../"
    fi
}

# keyboard layout
kb()
{
    xkblayout-state print %s
}

while true ; do
    echo "%{l} $(sp) | $(xt) %{r} $(c) | $(kb) | $(p)% ($(st)) "
    xdo lower -a bar
    sleep 0.2
done
