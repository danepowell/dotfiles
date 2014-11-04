alias sudo='sudo '

e() {
  if [ "$DISPLAY" ]
  then
    emacs $@ &
  else
    emacs $@
  fi
}

# if user is not root, pass all commands via sudo #
if [ $UID -ne 0 ]; then
  alias wifi-scan='sudo iwlist wlan0 scan'
  alias clean-boot='dpkg --get-selections|grep '"'"'linux-image*'"'"'|awk '"'"'{print $1}'"'"'|egrep -v "linux-image-$(uname -r)|linux-image-generic" |while read n;do sudo apt-get -y remove $n;done'
fi

if [ -f ~/.bash_aliases.local ]; then
    . ~/.bash_aliases.local
fi

cb() {
  local _scs_col="\e[0;32m"; local _wrn_col='\e[1;31m'; local _trn_col='\e[0;33m'
  # Check that xclip is installed.
  if ! type xclip > /dev/null 2>&1; then
    echo -e "$_wrn_col""You must have the 'xclip' program installed.\e[0m"
  # Check user is not root (root doesn't have access to user xorg server)
  elif [[ "$USER" == "root" ]]; then
    echo -e "$_wrn_col""Must be regular user (not root) to copy a file to the clipboard.\e[0m"
  else
    # If no tty, data should be available on stdin
    if ! [[ "$( tty )" == /dev/* ]]; then
      input="$(< /dev/stdin)"
    # Else, fetch input from params
    else
      input="$*"
    fi
    if [ -z "$input" ]; then  # If no input, print usage message.
      echo "Copies a string to the clipboard."
      echo "Usage: cb <string>"
      echo "       echo <string> | cb"
    else
      # Copy input to clipboard
      echo -n "$input" | xclip -selection c
      # Truncate text for status
      if [ ${#input} -gt 80 ]; then input="$(echo $input | cut -c1-80)$_trn_col...\e[0m"; fi
      # Print status.
      echo -e "$_scs_col""Copied to clipboard:\e[0m $input"
    fi
  fi
}

alias git-cleanup='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'

if [ -f ~/.bash_git ]; then
    . ~/.bash_git
fi