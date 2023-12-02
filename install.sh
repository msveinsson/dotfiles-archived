#!/usr/bin/env bash

set -e
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

DOT_FOLDERS=(
    "alacritty"
    "bash"
    "bat"
    "bin"
    "fish"
    "git"
    "htop"
    "kitty"
    "neofetch"
    "powershell"
    "sketchybar"
    "skhd"
    "starship"
    "tmux"
    "yabai"
    "yazi"
    "wezterm"
    "zsh"
)

echo "[+] Dotfiles :: $SCRIPT_DIR"

if ! command -v stow &> /dev/null; then
    brew install stow
fi

for folder in ${DOT_FOLDERS[@]}; do
  echo "[+] Folder :: $folder"
  stow -t $HOME $folder
done