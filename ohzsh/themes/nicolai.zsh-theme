LCHAR_WIDTH=%1G
LCHAR='$'


function kube_context_info() {
    echo "$(kubens -c)"
}

function kube_namespace_info() {
    echo "$(kubectl config current-context)"
}

PROMPT='%{$fg[blue]%}%c %{$fg[white]%}%{$LCHAR$LCHAR_WIDTH%} %{$reset_color%}'
RPROMPT='$(kube_namespace_info):$(kube_context_info) $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*"
