export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH=$HOME/.oh-my-zsh
export TERM="xterm-256color"

export NVIM_LISTEN_ADDRESS=/tmp/nvim nvim
#
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
plugins=(nvm)

BASE16_SHELL=$HOME/.config/base16-shell/ [ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# export NVIM_NODE_LOG_FILE=/tmp/nvim-debug.log


# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
 ulimit -n 2048
 bindkey -e

# User configuration

 export PATH="$HOME/neovim/bin:$PATH"
 alias vim=nvim

 export PATH=$PATH:~/scripts

 [ -f  ~/.fzf.zsh ] && source ~/.fzf.zsh

# autoenv
# source $(brew --prefix autoenv)/activate.sh
# export PATH="$HOME/bin:$PATH"

