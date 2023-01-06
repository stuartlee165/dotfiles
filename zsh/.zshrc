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

setopt AUTO_PARAM_SLASH
setopt AUTO_LIST

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


# Load any custom scripts we created
source $DOTFILES/zsh/scripts.sh

# Replace CTRL+l (clear screen) with CTRL+g because we use CTRL+l in tmux to move to left pane
bindkey -r '^l'
bindkey -r '^g'
bindkey -s '^g' 'clear\n'

### OS Specific Configs ###
source "${HOME}/dotfiles/zsh/.zshrc-`uname`"


### Install problems ###
# The following will need to be manually installed:
# fzf
# zsh-syntax-highlighting
# fonts https://github.com/ryanoasis/nerd-fonts#option-4-homebrew-fonts
