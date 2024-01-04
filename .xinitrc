#! /bin/sh

xrdb .Xresources
xsetroot -cursor_name left_ptr
exec dbus-daemon --session --address=unix:path=$XDG_RUNTIME_DIR/bus &
exec bspwm
