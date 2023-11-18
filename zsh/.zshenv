# Export XDG_CONFIG_HOME variable if it is not already defined
if [[ -z "$XDG_CONFIG_HOME" ]]
then
  export XDG_CONFIG_HOME="$HOME/.config"
fi

# Export ZDOTDIR variable if it is not already defined
if [[ -d "$XDG_CONFIG_HOME/zsh" ]]
then
  export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
fi