# Pass aliases to the root account
alias sudo='sudo '

e() {
  if [ "$DISPLAY" ]
  then
    emacs $@ &
  else
    emacs $@
  fi
}

if [ -f ~/.bash_aliases.local ]; then
    . ~/.bash_aliases.local
fi

cb() {
  local _scs_col="\e[0;32m"; local _wrn_col='\e[1;31m'; local _trn_col='\e[0;33m'
  # Check user is not root (root doesn't have access to user xorg server)
  if [[ "$USER" == "root" ]]; then
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
      if type clip.exe > /dev/null 2>&1; then
        echo -n "$input" | clip.exe
      elif type xclip > /dev/null 2>&1; then
        echo -n "$input" | xclip -selection c
      else
        echo -e "$_wrn_col""You must have the 'xclip' or 'clip.exe' program installed.\e[0m"
      fi
      # Truncate text for status
      if [ ${#input} -gt 80 ]; then input="$(echo $input | cut -c1-80)$_trn_col...\e[0m"; fi
      # Print status.
      echo -e "$_scs_col""Copied to clipboard:\e[0m $input"
    fi
  fi
}

alias git-cleanup='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d && git gc && git fetch --all -p'

alias xdebug='[[ "$XDEBUG_MODE" == debug ]] && { export XDEBUG_MODE=off && export COMPOSER_ALLOW_XDEBUG=0 && echo "Xdebug disabled"; } || { export XDEBUG_MODE=debug && export COMPOSER_ALLOW_XDEBUG=1 && echo "Xdebug enabled"; }'

alias docker-cleanup='docker kill $(docker ps -q); docker rm $(docker ps --filter=status=exited --filter=status=created -q); docker rmi -f $(docker images -aq); docker volume rm $(docker volume ls -q); docker builder prune -a'

php-version() {
  brew-php-switcher "$1" -s
}

alias k='kubectl -n remote-ides'

alias gcm='git checkout master || git checkout main'