# oh-my-zsh
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-vi-mode)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


# vi mode
bindkey -v

# Environment Variables
export PATH=/bin:/usr/bin:/usr/.local/bin:/sbin:/home/obathily/.local/bin:${PATH}
export PATH=/home/obathily/.cargo/bin/:${PATH}
export CURL_CA_BUNDLE="/etc/ssl/certs/ca-certificates.crt"
export REQUESTS_CA_BUNDLE="/etc/ssl/certs/ca-certificates.crt"
export EDITOR="nvim"
export LS_COLORS=$LS_COLORS:'ow=1;34:'
export PATH=$PATH:/usr/local/go/bin


# Basic

alias c="clear"
alias shn="shutdown -h now"
alias pp="xclip -sel clip"


# Shell

alias zi="nvim ~/.zshrc"
alias rld="exec zsh"

# CD's

alias cdc="cd ~/.config/"
alias cdt="cd ~/Téléchargements"
alias cdd="cd ~/dev"
alias cdn="cd ~/.config/nvim"


# PYTHON

alias pip="python -m pip"

# TMUX

alias tm="tmux"
alias tx="tmuxinator"
alias tmc="nvim ~/.tmux.conf"
alias txc="nvim ~/.config/tmuxinator"
alias tks="tmux kill-server"
alias txs="tx stop"

# Docker

alias dps="docker ps"
alias dpsa="dps -a"
alias dcub="docker compose up --build"
alias dcu="docker compose up"
alias dcs="docker compose stop"
alias dcr="docker compose rm"
alias dll="docker ps -aq"
alias dcd="docker compose down"
alias dcr="docker compose restart"
alias dcdv="dcd -v"
dockerclean() {
  docker stop $(docker ps -qa)
  docker rm $(docker ps -qa)
  docker rmi -f $(docker images -qa)
  docker volume rm $(docker volume ls -q)
  docker network rm $(docker network ls -q)
  docker system prune -af --volumes
}
alias doremi="docker images -f dangling=true -q | xargs docker rmi -f"

de() {
  if [[ -z "$1" ]]; then
    echo "docker exec: Missing container ID"
    return 1
  fi
  docker exec -it "${1}" ${2:-bash}
}

# zsh-vi-mode
ZVM_SYSTEM_CLIPBOARD_ENABLED=true

# Git

alias gs="git status"
alias gcd="git checkout dev"
alias gcm="git checkout main"
alias gmd="git merge dev"
alias gmm="git merge main"
alias glo="git log --oneline"
alias gta="git tag -a $@ -m"
alias gds="git diff --staged"

atg() {
  # Initialize branch with the active branch by default
  local branch
  branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
  if [ -z "$branch" ]; then
    branch="dev"
  fi
  # Execute autotag with the specified branch
  autotag -s "conventional" -b "$branch"
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
