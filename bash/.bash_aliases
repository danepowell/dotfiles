alias e='emacs -nw'
alias please='sudo'

# if user is not root, pass all commands via sudo #
if [ $UID -ne 0 ]; then
  alias reboot-delay='sudo shutdown -r 04:00 "Server will reboot overnight." &'
fi

if [ -f ~/.bash_aliases.local ]; then
    . ~/.bash_aliases.local
fi

