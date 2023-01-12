export ZSH="$HOME/.oh-my-zsh"

SPACESHIP_PACKAGE_SHOW=false

plugins=(git)

source $ZSH/oh-my-zsh.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

export PNPM_HOME="/home/rowdie/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
export PATH=$PATH:/usr/local/go/bin
export DENO_INSTALL="/home/rowdie/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
eval "$(starship init zsh)"

# aliases
alias mkdirtoday="mkdir $(date +%d-%m-%Y)"
alias rmf="rm -rf"
alias ls="exa --grid --icons --color=auto"
function gitup() {
  git add .
  git commit -a -m "$1"
  git push
}

function yadmup() {
  local msg=${1:-"$(date +%d-%m-%Y)"}
  yadm add -u
  yadm commit -a -m "$msg"
  yadm push
}

function cd() {
  builtin cd "$@" && ls
}
