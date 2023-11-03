#!/usr/bin/env bash

BANNER='
██████╗ ██████╗ ███████╗██╗    ██╗
██╔══██╗██╔══██╗██╔════╝██║    ██║
██████╔╝██████╔╝█████╗  ██║ █╗ ██║
██╔══██╗██╔══██╗██╔══╝  ██║███╗██║
██████╔╝██║  ██║███████╗╚███╔███╔╝
╚═════╝ ╚═╝  ╚═╝╚══════╝ ╚══╝╚══╝
Upgrading Homebrew and upgrading packages...
'
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

gum spin --show-output --spinner minidot --title "Updating brew..." -- brew update
printf "\n"

OUTDATED=$(gum spin --show-output --spinner minidot --title "Checking for outdated brew packages" -- brew outdated)

if [[ -n "$OUTDATED" ]]; then
	echo "$OUTDATED"
	gum confirm --selected.background=2 --selected.foreground=0 "Upgrade the outdated formulae above?" && brew upgrade
	printf "\n"
	brew cleanup --prune=all
	printf "\n"
else
	echo "All brew packages are up to date."
	printf "\n"
fi

gum spin --show-output --spinner minidot --title "Checking for brew issues..." -- brew doctor
