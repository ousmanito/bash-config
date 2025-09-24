set -o vi
ZSH_THEME="robbyrussell"

export PATH=/bin:/usr/bin:/usr/.local/bin:/sbin:/home/obathily/.local/bin:${PATH}
export PATH=/home/obathily/.cargo/bin/:${PATH}
export CURL_CA_BUNDLE="/etc/ssl/certs/ca-certificates.crt"
export REQUESTS_CA_BUNDLE="/etc/ssl/certs/ca-certificates.crt"
export NODE_TLS_REJECT_UNAUTHORIZED=0
export EDITOR="vim"
export LS_COLORS=$LS_COLORS:'ow=1;34:'
export OPENAI_API_KEY=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
export PATH=$PATH:/usr/local/go/bin


# BASICS

alias c="clear"
alias shn="shutdown -h now"
alias pp="xclip -sel clip"


# Shell

alias zi="cd ~/.oh-my-zsh/custom && nvim zshrc.zsh"
export ZSH=$HOME/.oh-my-zsh
alias rld="exec zsh"


# IDE
alias nvim="~/dev/nvim/nvim-linux-x86_64/bin/nvim"


# CD's

alias cdc="cd ~/.config/"
alias cdt="cd ~/Téléchargements"
alias cdd="cd ~/dev"
alias cdn="cd ~/.config/nvim"


# PYTHON

alias pip="python -m pip"

pv() {
    local requirements_file="requirements.txt"
    
    while getopts ":i:u:r:" opt; do
        case $opt in
            i) 
                package="$OPTARG"  
                if [ -z "$package" ]; then
                    echo "Package name required for installation (-i)."
                    return 1
                fi
                pipenv install "$package"
                ;;
            u)
                packag="$OPTARG" 
                if [ -z "$package" ]; then
                    echo "Package name required for uninstallation (-u)."
                    return 1
                fi
                pipenv uninstall "$package"
                ;;
            r)
                if [ -n "$OPTARG" ]; then
                    requirements_file="$OPTARG"
                fi
                ;;
            \?)
                echo "Invalid option: -$OPTARG"
                exit 2 ;;
        esac
    done
    
    if [ -f "$requirements_file" ] || [[ "$opt" == "r" ]]; then
        echo "Generating requirements file at: $requirements_file"
        pipenv requirements > "$requirements_file"
    fi
}


# TMUX

alias tm="tmux"
alias tx="tmuxinator"
alias tmc="nvim ~/.tmux.conf"
alias txc="nvim ~/.config/tmuxinator"
alias tks="tmux kill-server"
alias txs="tx stop"


# Obsidian

alias obs="~/dev/obsidian/Obsidian-1.5.12.AppImage"


# Dropbox

alias dropbox="python ~/dev/dropbox/dropbox.py"


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
  docker stop $(docker ps -qa) &&
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


# HTTPIE

alias httpie="~/Applications/HTTPie-2024.1.2_210ae89763f4b934a2f34895e8d5839a.AppImage"

# Sonar

alias ss="/home/obathily/dev/sonar-scanner-cli-7.0.2.4839-linux-x64/sonar-scanner-7.0.2.4839-linux-x64/bin/sonar-scanner"
