#!/bin/sh


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


alias j='z'
alias f='zi'
alias g='lazygit'
alias zsh-update-plugins="find "$ZDOTDIR/plugins" -type d -exec test -e '{}/.git' ';' -print0 | xargs -I {} -0 git -C {} pull -q"
alias nvimrc='nvim ~/.config/nvim/'
alias yay="paru"
alias lvim="env TERM=wezterm lvim"

# alias lvim='nvim -u ~/.local/share/lunarvim/lvim/init.lua --cmd "set runtimepath+=~/.local/share/lunarvim/lvim"'



# Remarkable
alias remarkable_ssh='ssh root@10.11.99.1'
alias restream='restream -p'

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

# easier to read disk
alias df='df -h'     # human-readable sizes
alias free='free -m' # show sizes in MB

# get top process eating memory
alias psmem='ps aux | sort -nr -k 4 | head -5'

# get top process eating cpu ##
alias pscpu='ps aux | sort -nr -k 3 | head -5'




# systemd
alias mach_list_systemctl="systemctl list-unit-files --state=enabled"

alias mach_java_mode="export SDKMAN_DIR="$HOME/.sdkman" && [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh""

alias m="git checkout master"
alias s="git checkout stable"

if [[ $TERM == "xterm-kitty" ]]; then
  alias ssh="kitty +kitten ssh"
fi