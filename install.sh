#!/bin/bash

########
# nvim #
########

# Make directories if the don't already exit
# -p only  create if doesn't already exist
mkdir -p "$HOME/.config/nvim"
mkdir -p "$HOME/.config/nvim/undo"
# Create link (ln) soft (s) force (f) between target and symlink
# f foreces creation. It removes any existing link or file with the same name before creating a new symlink
# # only linking the init file as we don't want other files such as the undo files to be linked
ln -sf "$HOME/dotfiles/nvim/init.vim" "$HOME/.config/nvim/init.vim"

# Create links for XResources
# Want to link the whole X11 file
# Remove the existing directory manually if it exists so the symlink can be created
# we can't use -f here (as above) as this only works for single files and here we are linking whole directory
rm -rf "$HOME/.config/X11"
ln -s "$HOME/dotfiles/X11" "$HOME/.config"
