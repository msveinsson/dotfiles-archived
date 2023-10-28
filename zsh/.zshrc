
# ███████╗███████╗██╗  ██╗
# ╚══███╔╝██╔════╝██║  ██║
#   ███╔╝ ███████╗███████║
#  ███╔╝  ╚════██║██╔══██║
# ███████╗███████║██║  ██║
# ╚══════╝╚══════╝╚═╝  ╚═╝
# Zsh is a shell designed for interactive use, although it is also a powerful scripting language.
# https://www.zsh.org/

alias clip="pbcopy"

alias ls="exa --icons --group-directories-first"
alias ll="exa --icons --group-directories-first -l"
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --T'
alias lta='ls --T -a'

alias grep='grep --color'
alias cat="bat"
alias vi="nvim"
alias vim="nvim"

# Set Starship prompt distro icon
export STARSHIP_DISTRO=""

# Set Starship prompt device icon
_device=$(system_profiler SPHardwareDataType | awk '/Model Name/ {print $3,$4,$5,$6,$7}')
case $_device in
*MacBook*) DEVICE="󰌢" ;;
*mini*) DEVICE="󰇄" ;;
*) DEVICE="" ;;
esac
export STARSHIP_DEVICE="$DEVICE"

# Set Starship prompt config file
export STARSHIP_CONFIG=$HOME/.config/starship_zsh.toml

# Load Starship
eval "$(starship init zsh)"
