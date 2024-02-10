export ZSH="$HOME/.oh-my-zsh"

# source $ZSH/oh-my-zsh.sh
eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.config/starship/starship.toml

# plugins can be found in $ZSH/plugins/
plugins=( 
    git
    zsh-autosuggestions
    fast-syntax-highlighting
    zsh-history-substring-search
    zsh-vi-mode
)

# google cloud platform
source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

# PATH
export PATH="$HOME/workspace/tools/find-my-namespace:$PATH"
export PATH="/Applications/IntelliJ IDEA.app/Contents/MacOS:$PATH"

# ALIASES
# shell
alias v="nvim"
alias zshconfig="nvim ~/.zshrc"
alias sourcezsh="source ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"

# nvim
alias nvimconfig="nvim ~/.config/nvim"

# exa
alias ls="exa -la"
alias lst="ls -T"

# lazygit
alias lg="lazygit"

# maven
alias mcv="./mvnw clean verify"
alias mci="./mvnw clean install"
alias mcist="./mvnw clean install -DskipTests"

# gradle
alias grb="./gradlew build"
alias grt="./gradlew test"

# git
alias gl5="git log -5"
alias gpl="git pull"
alias gps="git push"
alias ga="git add -p"
alias gcm="git commit"

# go 
export PATH="/usr/local/go/bin:$PATH"

# google cloud
alias gcplogin="gcloud auth application-default login"

# etc
alias workspace="cd ~/workspace"

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/gsteyn/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

### nvm and direnv
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

eval "$(direnv hook zsh)"
### end: nvm and direnv


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

