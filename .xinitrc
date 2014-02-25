#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# xresources
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# panel font fix
xset +fp ~/.fonts
xset +fp /usr/share/fonts/local
xset fp rehash

# panel fifo and script dir
export PANEL_FIFO="/tmp/panel-fifo"
export PATH="$PATH:/home/dion/.config/bspwm/panel"

# music player daemon
# mpd &

# background wallpaper
sh ~/.fehbg &

# compositing
compton -c --config ~/.config/compton/compton.conf &

# cursor
xsetroot -cursor_name left_ptr

# key bindings
sxhkd -f 100 &

# window manager
exec bspwm
