# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
CASE_SENSITIVE="true"
zstyle ':completion:*:*:git*' ignored-patterns 'fetch-pack|merge-*|mergetool'
plugins=(git)
source $ZSH/oh-my-zsh.sh
unsetopt share_history

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

DOTFILES_DIR="$HOME/.dotfiles"

# Make utilities available

PATH="$DOTFILES_DIR/bin:$PATH"

# Source the dotfiles (order matters)

for DOTFILE in "$DOTFILES_DIR"/system/.{function,path,env,alias,direnv,fnm,rvm}; do
  . "$DOTFILE"
done

if is-macos; then
  for DOTFILE in "$DOTFILES_DIR"/system/.{env,alias}.macos; do
    . "$DOTFILE"
  done
fi

# Wrap up

unset CURRENT_SCRIPT SCRIPT_PATH DOTFILE
export DOTFILES_DIR

# fnm
export PATH="/home/dane/.local/share/fnm:$PATH"
eval "`fnm env`"

# pnpm
export PNPM_HOME="/home/dane/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end