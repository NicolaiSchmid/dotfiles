LCHAR_WIDTH=%1G
LCHAR='$'

KUBE_CONTEXT="$(kubectl config current-context)"
KUBE_NAMESPACE="$(kubens -c)"

PROMPT='%{$fg[cyan]%}%c %{$fg[white]%}%{$LCHAR$LCHAR_WIDTH%} %{$reset_color%}'
RPROMPT='$KUBE_CONTEXT:$KUBE_NAMESPACE $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*"
