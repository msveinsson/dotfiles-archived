#!/usr/bin/env bash

set -e
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

DOT_FOLDERS="alacritty,bash,bat,fish,gh-dash,git,htop,kitty,lf,neofetch,powershell,starship,tmux,yabai,zsh"

echo "[+] Dotfiles :: $SCRIPT_DIR"

if ! command -v stow &> /dev/null; then
    brew install stow
fi

for folder in $(echo $DOT_FOLDERS | sed "s/,/ /g"); do
    echo "[+] Folder :: $folder"
    #stow -t $HOME -D $folder \
    #    --ignore=README.md --ignore=LICENSE
    stow -t $HOME $folder
done
