alias e='emacs -nw'

# if user is not root, pass all commands via sudo #
if [ $UID -ne 0 ]; then
  alias reboot-delay='sudo shutdown -r 04:00 "Server will reboot overnight." &'
  alias wifi-scan='sudo iwlist wlan0 scan'
  alias clean-boot='dpkg --get-selections|grep '"'"'linux-image*'"'"'|awk '"'"'{print $1}'"'"'|egrep -v "linux-image-$(uname -r)|linux-image-generic" |while read n;do sudo apt-get -y remove $n;done'
fi

if [ -f ~/.bash_aliases.local ]; then
    . ~/.bash_aliases.local
fi
