## 2020-05-16: Changed `echo` to `printf` so that backslashes are not interpretted by echo
##             and so that CUTBUFFER shows up exactly in the pasteboard without modification

pb-kill-line () {
  zle kill-line
  printf '%s' $CUTBUFFER | pbcopy
}

pb-kill-whole-line () {
  zle kill-whole-line
  printf '%s' $CUTBUFFER | pbcopy
}

pb-backward-kill-word () {
  zle backward-kill-word
  printf '%s' $CUTBUFFER | pbcopy
}

pb-kill-word () {
  zle kill-word
  printf '%s' $CUTBUFFER | pbcopy
}

pb-kill-buffer () {
  zle kill-buffer
  printf '%s' $CUTBUFFER | pbcopy
}

pb-copy-region-as-kill-deactivate-mark () {
  zle copy-region-as-kill
  zle set-mark-command -n -1
  printf '%s' $CUTBUFFER | pbcopy
}

pb-yank () {
  CUTBUFFER=$(pbpaste)
  zle yank
}

zle -N pb-kill-line
zle -N pb-kill-whole-line
zle -N pb-backward-kill-word
zle -N pb-kill-word
zle -N pb-kill-buffer
zle -N pb-copy-region-as-kill-deactivate-mark
zle -N pb-yank

bindkey '^K'   pb-kill-line

## optionally, remove the above and uncomment this only do special pasteboard kill on Ctrl+Alt+k
#bindkey '^[^K'   pb-kill-line  

bindkey '^U'   pb-kill-whole-line
bindkey '\e^?' pb-backward-kill-word
bindkey '\e^H' pb-backward-kill-word
bindkey '^W'   pb-backward-kill-word
bindkey '\ed'  pb-kill-word
bindkey '\eD'  pb-kill-word
bindkey '^X^K' pb-kill-buffer
bindkey '\ew'  pb-copy-region-as-kill-deactivate-mark
bindkey '\eW'  pb-copy-region-as-kill-deactivate-mark
bindkey '^Y'   pb-yank