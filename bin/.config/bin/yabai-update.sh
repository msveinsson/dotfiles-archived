#!/usr/bin/env bash

BANNER='
██╗   ██╗ █████╗ ██████╗  █████╗ ██╗
╚██╗ ██╔╝██╔══██╗██╔══██╗██╔══██╗██║
 ╚████╔╝ ███████║██████╔╝███████║██║
  ╚██╔╝  ██╔══██║██╔══██╗██╔══██║██║
   ██║   ██║  ██║██████╔╝██║  ██║██║
   ╚═╝   ╚═╝  ╚═╝╚═════╝ ╚═╝  ╚═╝╚═╝
Update Yabai tiling window manager
'

WARNING_MSG='To allow Yabai to inject code into Dock.app, a sudoers file must be created.
The sudoers file is located at /private/etc/sudoers.d/yabai.
The sudoers file must contain the following line:
<user> ALL=(root) NOPASSWD: sha256:<hash> <yabai> --load-sa
See: https://github.com/koekeishiya/yabai/wiki'


COMMANDS_MSG="
To update the sudoers file.
Run the following command and paste the valid sudoers content into the file:

# Update the sudoers file
sudo visudo -f /private/etc/sudoers.d/yabai

# stop yabai
yabai --stop-service

# start yabai
yabai --start-service
"

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

function show_warning() {
	gum style --border=rounded --padding="0 1" --foreground=187 --margin=1 --align center --width 80 --border-foreground=185 "$@"
}

function show_commands_to_run() {
	gum style --border=rounded --padding="0 1" --foreground=248 --margin=1 --align left --width 80 --border-foreground=244 "$@"
}

function show_action_completed() {
	gum style --border=rounded --padding="0 1" --foreground=2 --margin=1 --border-foreground=2 "$@"
}

function show_current_yabai_sudoer() {
    current_sudoer_content=$(sudo cat /private/etc/sudoers.d/yabai)

    out_msg_front=$(gum style --padding="0 2" --bold --foreground=2 "  Current :")
    out_msg_back=$(gum style --italic --foreground=255 "$current_sudoer_content")
    gum join "$out_msg_front" "$out_msg_back"
}

function show_valid_yabai_sudoer() {
    current_user=$(whoami)
    valid_hash=$(shasum -a 256 $(which yabai) | sed -e "s/  / /g") # use sed to remove extra spaces
    valid_sudoer_content="${current_user} ALL=(root) NOPASSWD: sha256:${valid_hash} --load-sa"
    
    out_msg_front=$(gum style --padding="0 2" --bold --foreground=3 "  Valid   :")
    out_msg_back=$(gum style --italic --foreground=255 "$valid_sudoer_content")
    gum join "$out_msg_front" "$out_msg_back"
}


clear_screen

show_banner "$BANNER"

# stop yabai
gum spin --spinner dot --title "Stopping Yabai Service" -- sleep 1 && yabai --stop-service

# upgrade yabai
gum spin --show-output --spinner dot --title "Upgrading Yabai with homebrew" -- brew upgrade yabai

# start yabai
gum spin --spinner dot --title "Starting Yabai Service" -- sleep 1 && yabai --start-service

show_action_completed "Yabai update complete"

show_warning "$WARNING_MSG"

# show current sudoer file
show_current_yabai_sudoer

# show valid sudoer file
show_valid_yabai_sudoer

# show commands to run
show_commands_to_run "$COMMANDS_MSG"