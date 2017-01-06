# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export TERM="xterm-256color"

# alias loadnvm=". /usr/local/opt/nvm/nvm.sh"
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /usr/local/lib/python3.5/site-packages/powerline/bindings/bash/powerline.sh

powerline_path=$(python -c 'import pkgutil; print pkgutil.get_loader("powerline").filename' 2>/dev/null)

  if [[ "$powerline_path" != "" ]]; then
    source ${powerline_path}/bindings/bash/powerline.sh
  else
    # Setup your normal PS1 here.
  fi

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

ulimit -n 2048
bindkey -e
bindkey '^[[1;9C' forward-word
bindkey '^[[1;9D' backward-word
plugins=(git svn bower brew nvm history dirpersist brew grunt tmux go golang node powerline)

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh
alias vim=nvim
alias vim=nvim

export PATH=$PATH:~/scripts
export GOPATH=$HOME/Documents/goProjects


[ -f  ~/.fzf.zsh ] && source ~/.fzf.zsh
