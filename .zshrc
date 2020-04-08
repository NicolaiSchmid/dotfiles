# Load our dotfiles like ~/.bash_prompt, etc…
#   ~/.extra can be used for settings you don’t want to commit,
#   Use it to configure your PATH, thus it being first in line.
for file in ~/.{extra,bash_prompt,exports,aliases,functions,design}; do
    [ -r "$file" ] && source "$file"
done
unset file

export EDITOR=vim

# History
HISTFILE=~/.zsh_history
HISTSIZE=100000000
SAVEHIST=100000000
setopt HIST_IGNORE_SPACE
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups # ignore duplication command history list
setopt hist_ignore_space
setopt hist_verify
setopt append_history
setopt share_history # share command history data

# generic colouriser
GRC=`which grc`
if [ "$TERM" != dumb ] && [ -n "$GRC" ]
    then
        alias colourify="$GRC -es --colour=auto"
        alias configure='colourify ./configure'
        for app in {diff,make,gcc,g++,ping,traceroute}; do
            alias "$app"='colourify '$app
    done
fi

# highlighting inside manpages and elsewhere
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

# input candies
source ~/.zinput

# sudo !! double enter fix
unsetopt HIST_VERIFY

[[ -e ~/.profile ]] && emulate sh -c 'source ~/.profile'

# Git completion
autoload -Uz compinit && compinit

# The fuck
eval $(thefuck --alias)

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/mc mc


export KUBECONFIG=~/.kube/config          
export DATASTORE_TYPE=kubernetes
export PATH="${PATH}:${HOME}/.krew/bin"



export PATH=$(yarn global bin):$PATH