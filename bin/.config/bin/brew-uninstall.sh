#!/usr/bin/env bash

BANNER='
██████╗ ██████╗ ███████╗██╗    ██╗
██╔══██╗██╔══██╗██╔════╝██║    ██║
██████╔╝██████╔╝█████╗  ██║ █╗ ██║
██╔══██╗██╔══██╗██╔══╝  ██║███╗██║
██████╔╝██║  ██║███████╗╚███╔███╔╝
╚═════╝ ╚═╝  ╚═╝╚══════╝ ╚══╝╚══╝
Uninstall Homebrew packages...
'
export HOMEBREW_NO_AUTO_UPDATE=1

# Check if gum is installed
if ! brew list gum &>/dev/null; then
	echo "Installing gum to make this script glamorous..."
	brew install gum >/dev/null 2>&1
fi

function clear_screen() {
	clear
}

function show_banner() {
	gum style --foreground 12 --border-foreground 12 --border double --align center --width 80 --margin "0 0" --padding "0 0" \ "$@"
}

clear_screen

show_banner "$BANNER"

OPTIONS=$(\
  gum spin --title "Fetching list of packages..." --show-output -- \
  brew bundle dump --describe --file - | \
  grep -E "^(brew|cask|#)" | \
  sed -E 's/^(brew|cask) \"(.*)\"(,.*)?/\2/' | \
  sed "s/#//" | \
  while read -r first;
    do
      if [[ $first != "#*" ]]; then
        read -r second
        echo "$second ($first)";
      else
        echo "$first"
      fi
    done \
)

echo "$OPTIONS" | gum choose --no-limit | sed -E "s/(.* )\(.*\)/\1/" | xargs brew uninstall