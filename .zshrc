plugins=(git brew dirhistory brew tmux tmuxinator npm node)
export ZSH=$HOME/.oh-my-zsh
export TERM="xterm-256color"
source $ZSH/oh-my-zsh.sh

export NVIM_LISTEN_ADDRESS=/tmp/nvim nvim

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

export NVIM_NODE_LOG_FILE=/tmp/nvim-debug.log

# alias loadnvm=". /usr/local/opt/nvm/nvm.sh"
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /usr/local/lib/python3.7/site-packages/powerline/bindings/zsh/powerline.zsh
PATH="$PYENV_ROOT/bin:$PATH"
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
ZSH_THEME="dracula"

ulimit -n 2048
bindkey -e
bindkey '^[[1;9C' forward-word
bindkey '^[[1;9D' backward-word

# User configuration
export PATH=$HOME/bin:/usr/local/bin:$PATH

export PATH="$HOME/neovim/bin:$PATH"
alias vim=nvim

export PATH=$PATH:~/scripts

[ -f  ~/.fzf.zsh ] && source ~/.fzf.zsh

# autoenv
source $(brew --prefix autoenv)/activate.sh
