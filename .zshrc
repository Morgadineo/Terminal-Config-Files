# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export EDITOR="nvim"

figlet -w 300 -f Delta\ Corps\ Priest\ 1 "Morgado" | lolcat

function clear() {
	command clear
	figlet -w 300 -f Delta\ Corps\ Priest\ 1 "Morgado" | lolcat
}

ZSH_THEME="agnoster"
DISABLE_AUTO_TITLE="true"
ENABLE_CORRECTION="true"

HIST_STAMPS="dd/mm/yyyy"

PROMPT='%n$ '

plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# %%%%% Alias %%%%%
alias back='function _back() { for ((i=0; i<$1; i++)); do ..; done; }; _back'
alias py='python3'
alias vi="nvim"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
