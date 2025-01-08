# Activate plugins
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
# source ~/.zsh/fzf-tab/fzf-tab.plugin.zsh

# History
HISTSIZE=2000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Keybindings
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward
bindkey '^[[C' forward-char
bindkey '^[[D' backward-char
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word
bindkey "^H" backward-kill-word
bindkey "^?" backward-delete-char

# Keybindings workarounds for Windows Terminal
if [[ -n $WT_SESSION ]]; then
    bindkey '^[OA' history-search-backward
    bindkey '^[OB' history-search-forward
    bindkey '^[OC' forward-char
    bindkey '^[OD' backward-char
    export COLORTERM='truecolor'
fi

# Add to path variable
export PATH=$HOME/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.local/share:$PATH

# Aliases
alias ls='ls --color'
alias py="python3"
alias pya="source ./.venv/bin/activate"
alias k="kubectl"

# Completion styling
zstyle ':completion:*' menu no
