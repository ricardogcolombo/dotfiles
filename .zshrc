# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export LC_ALL=en_US.UTF-8
export POWERLINE_COMMAND=~/Library/Python/lib/2.7/bin/powerline
export LANG=en_US.UTF-8

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"
# powerline_path=$(python -c 'import pkgutil; print pkgutil.get_loader("powerline").filename' 2>/dev/null)
  # if [[ "$powerline_path" != "" ]]; then
    # source ${powerline_path}/bindings/bash/powerline.sh
  # else
    # # Setup your normal PS1 here.
  # fi

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"
# move word in terminal
bindkey -e
bindkey '^[[1;9C' forward-word
bindkey '^[[1;9D' backward-word
# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git svn bower brew npm history dirpersist brew grunt tmux go golang node)

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias vim=nvim

export PATH=$PATH:~/scripts
export GOPATH=$HOME/Documents/goProjects
alias adidas='cd ~/../../Applications/XAMPP/htdocs/proyectos/adidas/'
alias oneview='cd ~/../../Applications/XAMPP/htdocs/proyectos/adidas/oneview'
alias audi='cd ~/../../Applications/XAMPP/htdocs/proyectos/audipeonline/'
alias eh='cd ~/../../Applications/XAMPP/htdocs/proyectos/eh_sapmobile_restructure/com.eh.sapmobile/'
alias masterdata='cd ~/../../Applications/XAMPP/htdocs/proyectos/adidas/masterdata/'
alias proyectos='cd ~/../../Applications/XAMPP/htdocs/proyectos/'
alias personales='cd ~/../../Applications/XAMPP/htdocs/proyectos/personales/'
alias angular='cd ~/../../Applications/XAMPP/htdocs/angular/'
alias react='cd ~/../../Applications/XAMPP/htdocs/proyectos/react/'
alias webserv='cd ~/../../Applications/XAMPP/htdocs/'
alias facu='cd ~/Documents/facu/'
alias VimBundle='cd ~/.nvim/bundle'
alias svnproject='cd ~/Documents/svnproject/'
alias openchrome='sudo open -a "~/../../Applications/Google\ Chrome.app" --args --disable-web-security'
alias opensafari='sudo open -a '/Applications/Safari.app' --args --disable-web-security'
alias g++='clang'
alias tmux="TERM=screen-256color-bce tmux"
alias gruntEH="sh ~/../../Applications/XAMPP/htdocs/proyectos/ehBuild.sh"

alias goProjects='cd ~/Documents/goProjects/src/goProjects'

##
# Your previous /Users/sovanta/.bash_profile file was backed up as /Users/sovanta/.bash_profile.macports-saved_2015-03-24_at_19:24:14
##

# MacPorts Installer addition on 2015-03-24_at_19:24:14: adding an appropriate PATH variable for use with MacPorts.
# Finished adapting your PATH environment variable for use with MacPorts.

