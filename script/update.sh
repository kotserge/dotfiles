#!/bin/sh

# Update the repository from dotfiles here
echo "Updating dotfiles..."

# Update the config files using rsync
echo "Updating config files..."

## Window Manager (WM)

### WM: i3
rsync -r ~/.config/i3/ ./config/i3/

### WM Compositor: picom
rsync -r ~/.config/picom/ ./config/picom/

### WM Status Bar: polybar
rsync -r --exclude polybar-weather ~/.config/polybar/ ./config/polybar/ 

### WM Application Launcher: rofi
rsync -r ~/.config/rofi/ ./config/rofi/

## Terminal

### Terminal: alacritty
rsync -r ~/.config/alacritty/ ./config/alacritty/

### Terminal Shell: zsh
rsync -r ~/.zshrc ./home/.zshrc

### Terminal File Explorer: ranger
rsync -r ~/.config/ranger/ ./config/ranger/

### Terminal File Viewer: bat
rsync -r ~/.config/bat/ ./config/bat/

### Terminal Process Viewer: bpytop
rsync -r ~/.config/bpytop/*.conf ./config/bpytop/

## Editor

### Editor: neovim
### find in nvim-dotfiles repository

### Editor: Visual Studio Code - Insiders
rsync -r ~/.config/Code\ -\ Insiders/User/settings.json ./config/Code\ -\ Insiders/User/

## Other

### Notification: dunst
rsync -r ~/.config/dunst/ ./config/dunst/

### Command Line System Information: neofetch
rsync -r ~/.config/neofetch/ ./config/neofetch/

### PDF Viewer: zathura
rsync -r ~/.config/zathura/ ./config/zathura/

### Lock Screen: i3lock-color
rsync -r ~/.local/bin/lock ./bin/lock