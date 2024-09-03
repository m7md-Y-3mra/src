arg=$1
[ $arg = "up" ] && amixer set Master 5dB+
[ $arg = "dowm" ] && amixer set Master 5dB-
[ $arg = "toggle" ] && amixer set Master toggle

pkill -RTMIN+30 dwmblocks
# $HOME/bin/dwmStatusBarRefresh.sh & 
