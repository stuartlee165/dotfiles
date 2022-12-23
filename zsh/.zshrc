fpath=($ZDOTDIR/external $fpath)
# zshrc file runs after the zshenv file
# environment variables were set in the zshenv script so they can be used in this script
# e.g. $XDG_CONFIG_HOME was set as an environment variable for "$HOME/.config"

# Source aliases from aliases file
source $XDG_CONFIG_HOME/zsh/aliases

# add hjkl to navigate autocompletion menu
# needs to go before autocompletion (just below)
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Autocompletion
# autoload -> loads a file containing shell comands
# zsh will look in the zsh file search path defined in the variable $fpath
# from there it will try and find compinit
# when the file is found its contents iwll be loaded as a function
# the function name will be the name of the file
# this can then be called like any other shell function
# see page 165 mouseless dev
autoload -U compinit; compinit

# Autocomplete hidden files
# (by default auto complete doesn't work for dot files)
_comp_options+=(globdots)
source $HOME/dotfiles/zsh/external/completion.zsh

# load promt modifier script (this is an external script saved in external which updates the prompt look)
autoload -Uz prompt_purification_setup; prompt_purification_setup

# Push and pop directories from a directory stack
# Makes accessing historically used files easier
# Push the current directory visited on to the stack.
setopt AUTO_PUSHD
# Do not store duplicate directories in the stack
setopt PUSHD_IGNORE_DUPS
# Do not print the directory stack after using
setopt PUSHD_SILENT

# enable vi mode
bindkey -v
export KEYTIMEOUT=1

autoload -Uz cursor_mode && cursor_mode

# use nvim to edit what is typed in command line prompt
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# Allows to jump to directories using bd
# E.g. bd a
source $HOME/dotfiles/zsh/external/bd.zsh
# source zsh-syntax-highlighting plugin
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Load any custom scripts we created
source $DOTFILES/zsh/scripts.sh

# load fzf autocompletion
# verifies that fzf exists and if it does source it
# and create some keybindings
if [ $(command -v "fzf") ]; then
    source /usr/share/fzf/completion.zsh
    source /usr/share/fzf/key-bindings.zsh
fi

# Start i3 on startup (page 174 mouseless dev)
# if tty = 1 then run i3
# only want to do this first tty not every tty that is created
# then
# pgrep p-> process -> fetch process
# || logical or operator if process i3 exists true returned and nothing else is executed
# if no i3 process then execute startx "$XDG_CONFIG_HOME/X11/.xinitrc"
# startx process then will replace the shell
# this is then replaced with i3 (thanks to .xinitrc see last line exex i3)
if [ "$(tty)" = "/dev/tty1" ];
then
    pgrep i3 || exec startx "$XDG_CONFIG_HOME/X11/.xinitrc"
fi
