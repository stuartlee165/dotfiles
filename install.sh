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


# install neovim plugin manager
[ ! -f "$DOTFILES/nvim/autoload/plug.vim" ] \
    && curl -fLo "$DOTFILES/nvim/autoload/plug.vim" --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir -p "$XDG_CONFIG_HOME/nvim/autoload"
ln -sf "$DOTFILES/nvim/autoload/plug.vim" "$XDG_CONFIG_HOME/nvim/autoload/plug.vim"

# Install (or update) all the plugins
nvim --noplugin +PlugUpdate +qa


#######
# i3  #
#######

# Delete the directory in case it exists
rm -rf "$HOME/.config/i3"
# Create a symlink targetting the whole i3 directory
ln -s "$HOME/dotfiles/i3" "$HOME/.config"


#######
# zsh #
#######

mkdir -p "$HOME/.config/zsh"
ln -sf "$HOME/dotfiles/zsh/.zshenv" "$HOME"
ln -sf "$HOME/dotfiles/zsh/.zshrc" "$HOME/.config/zsh"
ln -sf "$HOME/dotfiles/zsh/aliases" "$HOME/.config/zsh/aliases"

# create symlink for external file
# external directory contains the completion.zsh file which is used to improve autocomplete
# # external directory is where any code not written by is stored
# first remove any existing files
# then create new file with symlink
rm -rf "$HOME/.config/zsh/external"
ln -sf "$HOME/dotfiles/zsh/external" "$HOME/.config/zsh"
# to autoload everything from external directory need to add:
# prepend $ZDOTDIR/external to $fpath
# # zsh will therefore look in this directory for any external function we want to autoload
fpath=($ZDOTDIR/external $fpath)

