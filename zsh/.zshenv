export EDITOR=nvim

export PATH="~/.config/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"

export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache
export XDG_RUNTIME_DIR=/run/user/$UID

# ncurses - CRT screen handling and optimization package
export TERMINFO="$XDG_DATA_HOME"/terminfo
export TERMINFO_DIRS="$XDG_DATA_HOME"/terminfo:/usr/share/terminfo
export HISTFILE="$XDG_STATE_HOME"/zsh/history
export ANSIBLE_HOME="${XDG_CONFIG_HOME}/ansible"
export ANSIBLE_CONFIG="${XDG_CONFIG_HOME}/ansible.cfg"
export ANSIBLE_GALAXY_CACHE_DIR="${XDG_CACHE_HOME}/ansible/galaxy_cache"
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
export ANDROID_HOME="$XDG_DATA_HOME"/android
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history
export NUGET_PACKAGES="$XDG_CACHE_HOME"/NuGetPackages
export INPUTRC="$XDG_CONFIG_HOME"/readline/inputrc
