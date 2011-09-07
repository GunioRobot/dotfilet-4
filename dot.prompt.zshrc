# ----------------------------------------------------------------------
# Git status on command prompt
# ----------------------------------------------------------------------
setopt prompt_subst
autoload colors; colors

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn hg
zstyle ':vcs_info:*' formats '[%b]'
zstyle ':vcs_info:*' actionformats '[%b] (%a)'

precmd () {
    psvar=()
    vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}

PROMPT=$'%B%F{green}%n@%M%f %F{blue}%~%f%b%1(v| %F{yellow}%1v%f|)\n%B%F{blue}$%f%b '
