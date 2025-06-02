# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

autoload -U +X compinit && compinit

DOTFILES_DIR="$HOME/.dotfiles"

# Make utilities available

PATH="$DOTFILES_DIR/bin:$PATH"

# Source the dotfiles (order matters)

for DOTFILE in "$DOTFILES_DIR"/system/.{function,n,path,env,exports,alias,kube,rvm}; do
  . "$DOTFILE"
done

if is-macos; then
  for DOTFILE in "$DOTFILES_DIR"/system/.{env,alias,completion}.macos; do
    . "$DOTFILE"
  done
fi

# Set up ZSH
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
CASE_SENSITIVE="true"
zstyle ':completion:*:*:git*' ignored-patterns 'fetch-pack|merge-*|mergetool'
plugins=(git-auto-fetch direnv)
source $ZSH/oh-my-zsh.sh
unsetopt share_history

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Wrap up

unset CURRENT_SCRIPT SCRIPT_PATH DOTFILE
export DOTFILES_DIR

# Git branch and tag commands can't just print to STDOUT like a normal program...
# https://stackoverflow.com/questions/48341920/git-branch-command-behaves-like-less
export LESS=-FRX
export TELEPORT_ADD_KEYS_TO_AGENT=no
source /opt/teleport-tool/aliases
export PATH="/opt/homebrew/opt/mysql@8.4/bin:$PATH"
