#!/bin/sh

# Update dotfiles from repository here
# Update the config files using rsync
echo "Updating dotfiles..."

# config
rsync -r --exclude lock ./config/* ~/.config/

# home
rsync -r ./zshrc ~/.zshrc

# bin
rsync -r ./bin/lock ~/.local/bin/lock
