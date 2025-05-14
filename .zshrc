setopt auto_cd

# This is needed due to an error that occurs when going back-and-forth between INSERT and VISUAL mode 
if [[ "${widgets[zle-keymap-select]#user:}" == "starship_zle-keymap-select" || \
      "${widgets[zle-keymap-select]#user:}" == "starship_zle-keymap-select-wrapped" ]]; then
    zle -N zle-keymap-select "";
fi
eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.config/starship/starship.toml

eval "$(sheldon source)"

# export ZSH="$HOME/.oh-my-zsh"
# source $ZSH/oh-my-zsh.sh
# # plugins can be found in $ZSH/plugins/
# # custom plugins can be found in $ZSH_CUSTOM/plugins
# plugins=( 
#     git
#     zsh-autosuggestions
#     fast-syntax-highlighting
#     zsh-history-substring-search
#     zsh-vi-mode
# )

# key bindings for plugins
# bindkey "^[[A" history-substring-search-up
# bindkey "^[[B" history-substring-search-down
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# google cloud platform
# source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
# source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"
# export USE_GKE_GCLOUD_AUTH_PLUGIN=True

for f in ~/.config/zsh_config/*; do source $f; done

# PATH
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/Applications/IntelliJ IDEA.app/Contents/MacOS:$PATH"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# asdf
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

# go 
export PATH="/usr/local/go/bin:$PATH"

# google cloud
alias gcplogin="gcloud auth application-default login"

# etc
alias workspace="cd ~/workspace"


eval "$(zoxide init zsh)"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/workspace/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/workspace/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/gareth/workspace/google-cloud-sdk/completion.zsh.inc' ]; then . "$HOME/workspace/google-cloud-sdk/completion.zsh.inc"; fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"


#eval "$($HOME/miniforge3/bin/conda shell.zsh hook)"
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$("$HOME/miniforge3/bin/conda" 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/miniforge3/etc/profile.d/conda.sh" ]; then
        . "$HOME/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# Created by `pipx` on 2025-04-11 08:56:07
export PATH="$PATH:$HOME/.local/bin"

