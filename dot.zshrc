# ----------------------------------------------------------------------
# Complement
# ----------------------------------------------------------------------
# Command complemention e.g. ls -[tab] then list options
autoload -U compinit
compinit

# Colorize completion list e.g. ls [tab]
zstyle ':completion:*' list-colors 'di=36' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

# ----------------------------------------------------------------------
# Language
# ----------------------------------------------------------------------
export LANG=ja_JP.UTF-8

# ----------------------------------------------------------------------
# History
# ----------------------------------------------------------------------
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt hist_ignore_dups # Ignore duplicated command of history
setopt share_history # Share history between terminals by HISTFILE

# ----------------------------------------------------------------------
# Prompt
# ----------------------------------------------------------------------
PROMPT='%n%# '

# ----------------------------------------------------------------------
# Aliases
# ----------------------------------------------------------------------
# bundle
alias b='bundle'
alias be='bundle exec'
alias bi='bundle install'
alias bo='bundle open'

# ls
alias ls='ls -FG'
alias la='ls -A'
alias sl='ls' # Hedge typo

# rails
alias r='rails'
alias rc='rails c'
alias rs='rails s'

# rake
alias rk='rake'
alias rksd='rake db:seed'
alias rksp='rake spec'
alias rkcu='rake cucumber'
alias rkt='rake spec cucumber' # Test all
alias rkrs='rake db:drop db:create db:migrate' # ReSet

# others
alias c='coffee'
alias cof='coffee'

alias du='du -h'

alias e='exit'
alias g='git'
alias h='cd ~'
alias j='jobs -l'
alias n='netstat -tuna'
alias p='ps auxxx'

alias s='svn'

alias sc='screen -U'
alias screen='screen -U'

alias v='vim'

alias up='cd ..'

# ----------------------------------------------------------------------
# Git status
# ----------------------------------------------------------------------
setopt prompt_subst
autoload -Uz colors
colors
autoload -Uz add-zsh-hook
# for vcs_info
function _precmd_vcs_info() {
  LANG=en_US.UTF-8 vcs_info
}
add-zsh-hook precmd _precmd_vcs_info
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats "%b" "%s"
zstyle ':vcs_info:*' actionformats "%b|%a" "%s"
function vcs_info_for_git() {
  VCS_GIT_PROMPT="${vcs_info_msg_0_}"
  VCS_GIT_PROMPT_CLEAN="%{${fg[green]}%}"
  VCS_GIT_PROMPT_DIRTY="%{${fg[yellow]}%}"

  VCS_GIT_PROMPT_ADDED="%{${fg[cyan]}%}A%{${reset_color}%}"
  VCS_GIT_PROMPT_MODIFIED="%{${fg[yellow]}%}M%{${reset_color}%}"
  VCS_GIT_PROMPT_DELETED="%{${fg[red]}%}D%{${reset_color}%}"
  VCS_GIT_PROMPT_RENAMED="%{${fg[blue]}%}R%{${reset_color}%}"
  VCS_GIT_PROMPT_UNMERGED="%{${fg[magenta]}%}U%{${reset_color}%}"
  VCS_GIT_PROMPT_UNTRACKED="%{${fg[red]}%}?%{${reset_color}%}"

  INDEX=$(git status --porcelain 2> /dev/null)
  if [[ -z "$INDEX" ]];then
    STATUS="${VCS_GIT_PROMPT_CLEAN}${VCS_GIT_PROMPT}%{${reset_color}%}"
  else
    STATUS=" ${VCS_GIT_PROMPT_DIRTY}${VCS_GIT_PROMPT}%{${reset_color}%}"
    if $(echo "$INDEX" | grep '^UU ' &> /dev/null); then
      STATUS="$VCS_GIT_PROMPT_UNMERGED$STATUS"
    fi
    if $(echo "$INDEX" | grep '^R ' &> /dev/null); then
      STATUS="$VCS_GIT_PROMPT_RENAMED$STATUS"
    fi
    if $(echo "$INDEX" | grep '^ D ' &> /dev/null); then
      STATUS="$VCS_GIT_PROMPT_DELETED$STATUS"
    fi
    if $(echo "$INDEX" | grep '^?? ' &> /dev/null); then
      STATUS="$VCS_GIT_PROMPT_UNTRACKED$STATUS"
    fi
    if $(echo "$INDEX" | grep '^ M ' &> /dev/null); then
      STATUS="$VCS_GIT_PROMPT_MODIFIED$STATUS"
    fi
    if $(echo "$INDEX" | grep '^A ' &> /dev/null); then
      STATUS="$VCS_GIT_PROMPT_ADDED$STATUS"
    elif $(echo "$INDEX" | grep '^M ' &> /dev/null); then
      STATUS="$VCS_GIT_PROMPT_ADDED$STATUS"
    fi
  fi
  echo "${STATUS}"
}
function vcs_info_with_color() {
  VCS_PROMPT_PREFIX="%{${fg[green]}%}[%{${reset_color}%}"
  VCS_PROMPT_SUFFIX="%{${fg[green]}%}]%{${reset_color}%}"

  VCS_NOT_GIT_PROMPT="%{${fg[green]}%}${vcs_info_msg_0_}%{${reset_color}%}"

  if [[ -n "${vcs_info_msg_0_}" ]]; then
    if [[ "${vcs_info_msg_1_}" = "git" ]]; then
      STATUS=$(vcs_info_for_git)
    else
      STATUS=${VCS_NOT_GIT_PROMPT}
    fi
    echo " ${VCS_PROMPT_PREFIX}${STATUS}${VCS_PROMPT_SUFFIX}"
  fi
}
RPROMPT='[%~]$(vcs_info_with_color)'

# ----------------------------------------------------------------------
# Others
# ----------------------------------------------------------------------
export LSCOLORS=gxfxcxdxbxegedabagacad # Set color of ls
export EDITOR=vim

setopt auto_cd # cd-able without cd
setopt auto_pushd # cd-able to past directories by cd -[tab]
setopt correct # Correct wrong commands
setopt list_packed
setopt cdable_vars

bindkey -e
