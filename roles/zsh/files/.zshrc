# History
HISTSIZE=2000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt APPENDHISTORY             # Append history lines to the history file, rather than overwriting it.
setopt SHAREHISTORY              # Share history between all sessions.
setopt HIST_IGNORE_SPACE         # Ignore commands that start with a space.
setopt HIST_IGNORE_ALL_DUPS      # Remove all previous duplicates of a command from the history list when it is added.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.

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
typeset -U path  # Ensures unique entries
path=(
 $HOME/bin
 $HOME/.local/bin
 $HOME/.local/share
 $path
)

# Aliases
alias ls='ls --color'
alias py="python3"
alias pya="source ./.venv/bin/activate"
alias k="kubectl"

# Completion styling
zstyle ':completion:*' menu no                  # Disable menu-based selection during tab completion.
zstyle ':completion:*' accept-exact '*(N)'      # Automatically accept exact matches when completing.
zstyle ':completion:*' use-cache on             # Enable caching for faster completion results.
zstyle ':completion:*' cache-path ~/.zsh/cache  # Define the location to store the completion cache.

# Activate plugins
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_USE_ASYNC=true
ZSH_AUTOSUGGEST_MANUAL_REBIND=true
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
# source ~/.zsh/fzf-tab/fzf-tab.plugin.zsh