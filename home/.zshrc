# zsh installation
export ZSH="$HOME/.config/.oh-my-zsh"

# zsh theme
ZSH_THEME="lambda"

# auto-corrections
# ENABLE_CORRECTION="true"

# plugins
plugins=(git)

# User configurations
source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

#
eval $(thefuck --alias fuck)
eval "$(zoxide init zsh)"
source <(fzf --zsh)

# Aliases
alias rm="rm -ri"
alias c="clear"
alias cd=z
