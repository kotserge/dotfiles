#!/bin/sh

# Update dotfiles from repository here
# Update the config files using rsync
echo "Updating dotfiles..."

# config
rsync -r ./config/* ~/.config/

# home
rsync -r home ~

# bin
rsync -r ./bin/lock ~/.local/bin/lock
