# heavily modified from sonicradish and other bits and bobs

#local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

#RTFM: https://www-s.acm.illinois.edu/workshops/zsh/prompt/escapes.html

setopt promptsubst

autoload -U add-zsh-hook
ROOT_ICON_COLOR=$FG[111]
MACHINE_NAME_COLOR=$FG[208]
PROMPT_SUCCESS_COLOR=$FG[103]
PROMPT_FAILURE_COLOR=$FG[124]
PROMPT_VCS_INFO_COLOR=$FG[242]
PROMPT_PROMPT=$FG[208]
GIT_DIRTY_COLOR=$FG[124]
GIT_CLEAN_COLOR=$FG[148]
GIT_PROMPT_INFO=$FG[148]

AWS_COLOR=$FG[124]

# %{$fg[red]%}%n%{$reset_color%}

# Hash
ROOT_ICON="# "
if [[ $EUID -ne 0 ]] ; then
  ROOT_ICON="ᐅ "
fi

# function virtualenv_prompt_info(){
#   [[ -n ${VIRTUAL_ENV} ]] || return
#   echo "${ZSH_THEME_VIRTUALENV_PREFIX:=[}${VIRTUAL_ENV:t}${ZSH_THEME_VIRTUALENV_SUFFIX:=]}"
# }

PYENV_PROMPT_DEFAULT_VERSION=${PYENV_PROMPT_DEFAULT_VERSION:="system"}

function _pyenv_prompt_info {
  if [ -n "$(whence pyenv_prompt_info)" ]; then
    local _prompt_info="$(pyenv_prompt_info)"
    if [ -n "$_prompt_info" ] && [ "$_prompt_info" != "${PYENV_PROMPT_DEFAULT_VERSION}" ]; then
      echo "${ZSH_THEME_PYENV_PROMPT_PREFIX}$(pyenv_prompt_info)$(_virtualenv_prompt_info inline)${ZSH_THEME_PYENV_PROMPT_SUFFIX}"
    fi
  fi
}

function _docker_prompt_info {
  DOCKER_PROMPT_INFO="${DOCKER_PROMPT_INFO:-${DOCKER_MACHINE_NAME}}"
  DOCKER_PROMPT_INFO="${DOCKER_PROMPT_INFO:-${DOCKER_HOST/tcp:\/\//}}"
  if [ -n "${DOCKER_PROMPT_INFO}" ]; then
    echo "${ZSH_THEME_DOCKER_PROMPT_PREFIX}${DOCKER_PROMPT_INFO}${ZSH_THEME_DOCKER_PROMPT_SUFFIX}"
  fi
}


function _virtualenv_prompt_info {
  if [[ -n "$(whence virtualenv_prompt_info)" ]]; then
    # FOOB="function exists"
    if [[ -n "$VIRTUAL_ENV" ]]; then
      venv="$(basename $VIRTUAL_ENV)"
      printf " $venv"
    fi
  fi
}

function _aws_profile_info {
    if [ -n "${AWS_PROFILE+x}" ]; then
      echo -n "%{$fg[green]%}\u2601 $AWS_PROFILE%{$reset_color%} "
    fi
}

function _env_info {
    if [ -n "${ENVIRONMENT+x}" ]; then
      printf "\u2601 $ENVIRONMENT "
    fi
}

function _kubectl_info {
  KUBECTL_CLOUD_PREFIX='☁ '
  KUBECTL_CLOUD_SUFFIX=' '

  #get the current context
  KUBECTL_CURRENT_CONTEXT="$(kubectl config current-context 2>/dev/null)"

  if [ ! -z "$KUBECTL_CURRENT_CONTEXT" ]; then
    # echo has context
    KUBECTL_CURRENT_CLUSTER="$(cut -d '_' -f 4 <<<$KUBECTL_CURRENT_CONTEXT)"

    # if grep -q "minikube" <<<"${KUBECTL_CURRENT_CLUSTER}" ; then
    #   KUBECTL_PROMPT="%{$fg[green]%}${KUBECTL_CLOUD_PREFIX}${KUBECTL_CURRENT_CLUSTER}"
    # fi

    if grep -q "prod" <<<"${KUBECTL_CURRENT_CLUSTER}" ; then
      KUBECTL_PROMPT="%{$fg[green]%}${KUBECTL_CLOUD_PREFIX}${KUBECTL_CURRENT_CLUSTER}"
    fi
    if grep -q "staging" <<<"${KUBECTL_CURRENT_CLUSTER}" ; then
      KUBECTL_PROMPT="%{$fg[green]%}${KUBECTL_CLOUD_PREFIX}${KUBECTL_CURRENT_CLUSTER}"
    fi
    if grep -q "testing" <<<"${KUBECTL_CURRENT_CLUSTER}" ; then
      KUBECTL_PROMPT="%{$fg[green]%}${KUBECTL_CLOUD_PREFIX}${KUBECTL_CURRENT_CLUSTER}"
    fi
    if grep -q "dev" <<<"${KUBECTL_CURRENT_CLUSTER}" ; then
      KUBECTL_PROMPT="%{$fg[green]%}${KUBECTL_CLOUD_PREFIX}${KUBECTL_CURRENT_CLUSTER}"
    fi
    echo "${KUBECTL_PROMPT}%{$reset_color%}"
  fi

  # echo ${#KUBECTL_CURRENT_CONTEXT}

  # ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}[%{$fg[cyan]%}"
  # ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
  # ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}] %{$fg[yellow]%}⚡%{$reset_color%}"
  # ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}]"

}

# PROMPT='%{$ROOT_ICON_COLOR%}$ROOT_ICON%{$reset_color%}%{$MACHINE_NAME_COLOR%}%m➜  %{$reset_color%}%{$PROMPT_SUCCESS_COLOR%}%~%{$reset_color%} %{$GIT_PROMPT_INFO%}$(git_prompt_info)%{$GIT_DIRTY_COLOR%}$(git_prompt_status) %{$reset_color%}%{$PROMPT_PROMPT%}ᐅ %{$reset_color%} '
# PROMPT='%{$ROOT_ICON_COLOR%}$ROOT_ICON%{$reset_color%}%{$MACHINE_NAME_COLOR%}%m➜ $(_virtualenv_prompt_info)$(_pyenv_prompt_info)$(_docker_prompt_info) %{$reset_color%}%{$PROMPT_SUCCESS_COLOR%}%3~%{$reset_color%} %{$GIT_PROMPT_INFO%}$(git_prompt_info)%{$GIT_DIRTY_COLOR%}$(git_prompt_status) %{$reset_color%}%{$PROMPT_PROMPT%}ᐅ %{$reset_color%} '
# %{$MACHINE_NAME_COLOR%}%m➜ \

# PROMPT='%{$ROOT_ICON_COLOR%}$(_env_info)%{$reset_color%}\
# %{$ROOT_ICON_COLOR%}$ROOT_ICON%{$reset_color%}\
PROMPT='\
%{$ROOT_ICON_COLOR%}$(_env_info)%{$reset_color%}\
%{$GIT_DIRTY_COLOR%}$(_virtualenv_prompt_info)%{$reset_color%}\
$(_aws_profile_info)\
$(_pyenv_prompt_info)\
$(_kubectl_info)\
$(_docker_prompt_info)\
%{$reset_color%}\
%{$PROMPT_SUCCESS_COLOR%}%6~%{$reset_color%}\
%{$GIT_PROMPT_INFO%}$(git_prompt_info)%{$GIT_DIRTY_COLOR%}$(git_prompt_status)%{$reset_color%}\
%{$PROMPT_PROMPT%}
$ROOT_ICON%{$reset_color%}\
%{$reset_color%}'
# ᐅ %{$reset_color%}'

#RPS1="${return_code}"

ZSH_THEME_AWS_PREFIX=""
ZSH_THEME_AWS_SUFFIX=""

#git branch AKA: printf "\ue725"
ZSH_THEME_GIT_PROMPT_PREFIX="( "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$GIT_PROMPT_INFO%})"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$GIT_DIRTY_COLOR%}✘"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$GIT_CLEAN_COLOR%}✔"

ZSH_THEME_GIT_PROMPT_ADDED="%{$FG[103]%}✚%{$rset_color%}"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$FG[103]%}✹%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DELETED="%{$FG[103]%}✖%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$FG[103]%}➜%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$FG[103]%}═%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$FG[103]%}✭%{$reset_color%}"

ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX="venv:‹%{$fg[red]%}"
ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX="%{$fg[blue]%}› "

ZSH_THEME_PYENV_PROMPT_PREFIX="py:‹%{$fg[red]%}"
ZSH_THEME_PYENV_PROMPT_SUFFIX="%{$fg[blue]%}› "

ZSH_THEME_DOCKER_PROMPT_PREFIX="d:‹%{$fg[red]%}"
ZSH_THEME_DOCKER_PROMPT_SUFFIX="%{$fg[blue]%}› "
