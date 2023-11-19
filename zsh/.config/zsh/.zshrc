#!/bin/env zsh

# Zap package manager
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

# history
HISTSIZE=110000
SAVEHIST=100000
HISTFILE="${ZDOTDIR:-$HOME}/.histfile"

# disable shell sessions
SHELL_SESSIONS_DISABLE=1
 
# source
plug "${ZDOTDIR}/source/aliases.zsh"
plug "${ZDOTDIR}/source/exports.zsh"
plug "${ZDOTDIR}/source/options.zsh"

# plugins
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-completions"
plug "zsh-users/zsh-history-substring-search"
plug "zsh-users/zsh-syntax-highlighting"
plug "hlissner/zsh-autopair"
plug "zap-zsh/zap-prompt"
plug "zap-zsh/supercharge"
plug "zap-zsh/fzf"
plug "zap-zsh/vim"
plug "olets/zsh-abbr"

# olets/zsh-abbr config
ABBR_USER_ABBREVIATIONS_FILE="${ZDOTDIR}/plugins/zsh-abbr-user_abbreviations"
abbr load

# keybinds
bindkey '^ ' autosuggest-accept

eval "$(zoxide init zsh)"
#eval "$(starship init zsh)"