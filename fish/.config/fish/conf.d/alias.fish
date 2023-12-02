# fish alaises

alias cat "bat"
alias vi "nvim"
alias vim "nvim"

# Clipboard
alias clip "pbcopy"

# Run Update scripts 
alias brewup "~/.config/bin/brew-update.sh"
alias yabaiup "~/.config/bin/yabai-update.sh"

# Lsd aliases
alias l "lsd  --group-dirs first"
alias la "lsd  --group-dirs first -A"
alias ll "lsd  --group-dirs first -l"
alias lla "lsd  --group-dirs first -Al"
alias lt "lsd  --group-dirs last --tree"
alias lta "lsd  --group-dirs last -A --tree"

# Colorize grep output
alias grep "grep --color=auto"

# Confirm before overwriting or deleting
alias cp "cp -i"
alias mv "mv -i"
alias rm "rm -i"

# Easier to read disk
alias df "df -h"     # human-readable sizes
alias free "free -m" # show sizes in MB

# Get top process eating memory
alias psmem "ps aux | sort -nr -k 4 | head -5"

# Get top process eating cpu ##
alias pscpu "ps aux | sort -nr -k 3 | head -5"