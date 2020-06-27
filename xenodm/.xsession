xsetroot -solid black

resources=/home/cfa/.Xresources
exe_prefix=/usr/local

setxkbmap -option caps:swapescape

if [ -f "" ]; then
        /usr/X11R6/bin/xrdb -load ""
fi

/usr/local/bin/xmonad
