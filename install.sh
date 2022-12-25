#!/bin/bash

########
# nvim #
########

# Make directories if the don't already exit
# -p only  create if doesn't already exist
mkdir -p "$XDG_CONFIG_HOME/nvim"
mkdir -p "$XDG_CONFIG_HOME/nvim/undo"
# Create link (ln) soft (s) force (f) between target and symlink
# f foreces creation. It removes any existing link or file with the same name before creating a new symlink
# # only linking the init file as we don't want other files such as the undo files to be linked
ln -sf "$DOTFILES/nvim/init.vim" "$XDG_CONFIG_HOME/nvim/init.vim"

# install neovim plugin manager
# -f flags if file exists
# ! negation operator -> expression will be true if output of -f is false
# curl -fLo --create-dirs -> will be executed if plug.vim doesnt exist
# \ are to write a command that should be on one line but is on multiple lines
[ ! -f "$DOTFILES/nvim/autoload/plug.vim" ] \
    && curl -fLo "$DOTFILES/nvim/autoload/plug.vim" --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir -p "$XDG_CONFIG_HOME/nvim/autoload"
ln -sf "$DOTFILES/nvim/autoload/plug.vim" "$XDG_CONFIG_HOME/nvim/autoload/plug.vim"

# Install (or update) all the plugins
nvim --noplugin +PlugUpdate +qa

#########
# picom #
#########

# Same as above for picom which is used to manage window opacity
mkdir -p "$XDG_CONFIG_HOME/picom"
ln -sf "$DOTFILES/picom/picom.conf" "$XDG_CONFIG_HOME/picom/picom.conf"


#######
# X11 #
#######
#
# Create links for XResources
# Want to link the whole X11 file
# Remove the existing directory manually if it exists so the symlink can be created
# we can't use -f here (as above) as this only works for single files and here we are linking whole directory
rm -rf "$XDG_CONFIG_HOME/X11"
ln -s "$DOTFILES/X11" "$XDG_CONFIG_HOME"


#######
# i3  #
#######

# Delete the directory in case it exists
# Note that we are using $XDH_CONFIG_HOME here -> this was previously $HOME/.config
# But we updated to use environment variable instead
# this way if we want to change the location we just change it in the dotfiles/.zshenv file only
rm -rf "$XDG_CONFIG_HOME/i3"

# Create a symlink targetting the whole i3 directory
ln -s "$DOTFILES/i3" "$XDG_CONFIG_HOME"


#######
# zsh #
#######

mkdir -p "$XDG_CONFIG_HOME/zsh"
ln -sf "$DOTFILES/zsh/.zshenv" "$HOME"
ln -sf "$DOTFILES/zsh/.zshrc" "$XDG_CONFIG_HOME/zsh"
ln -sf "$DOTFILES/zsh/aliases" "$XDG_CONFIG_HOME/zsh/aliases"

# create symlink for external file
# external directory contains the completion.zsh file which is used to improve autocomplete
# # external directory is where any code not written by is stored
# first remove any existing files
# then create new file with symlink
rm -rf "$XDG_CONFIG_HOME/zsh/external"
ln -sf "$DOTFILES/zsh/external" "$XDG_CONFIG_HOME/zsh"
# to autoload everything from external directory need to add:
# prepend $ZDOTDIR/external to $fpath
# # zsh will therefore look in this directory for any external function we want to autoload
fpath=($ZDOTDIR/external $fpath)

#########
# Fonts #
#########

mkdir -p "$XDG_DATA_HOME"
cp -rf "$DOTFILES/fonts" "$XDG_DATA_HOME"

# Note to refresh font cache: fc-cache -f
# to see list of all fonts available: fc-list

#########
# dunst #
#########

mkdir -p "$XDG_CONFIG_HOME/dunst"
ln -sf "$DOTFILES/dunst/dunstrc" "$XDG_CONFIG_HOME/dunst/dunstrc"



########
# tmux #
########

# make the tmux directory in the $HOME/.config directory if it doesn't 
# already exist
# then create a symlink to the dotfiles file
mkdir -p "$XDG_CONFIG_HOME/tmux"
ln -sf "$DOTFILES/tmux/tmux.conf" "$XDG_CONFIG_HOME/tmux/tmux.conf"
# download the tmux plugin manager if its not already on the system
[ ! -d "$XDG_CONFIG_HOME/tmux/plugins" ] \
&& git clone https://github.com/tmux-plugins/tpm \
"$XDG_CONFIG_HOME/tmux/plugins/tpm"
