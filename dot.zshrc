# ----------------------------------------------------------------------
# Complement
# ----------------------------------------------------------------------
# Command complemention e.g. ls -[tab] then list options
autoload -U compinit
compinit

# Colorize completion list e.g. ls [tab]
zstyle ':completion:*' list-colors 'di=36' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

# ----------------------------------------------------------------------
# History
# ----------------------------------------------------------------------
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt hist_ignore_dups # Ignore duplicated command of history
setopt share_history # Share history between terminals by HISTFILE

# ----------------------------------------------------------------------
# Screen
# ----------------------------------------------------------------------
# Show previous-typed command to title
# Not to show lengthy title, show only command and a first arg if exists
preexec() {
  if [ $TERM = "screen" ]; then # Not to show previous-typed command on not screen
    command="${(z)2}"
    array=(`echo $command`) # String to Array
    title=(`echo "$array[1] $array[2]" | cut -c1-10`)
    echo -ne "\ek[$title]\e\\"
  fi
}

# ----------------------------------------------------------------------
# Others
# ----------------------------------------------------------------------
export LSCOLORS=gxfxcxdxbxegedabagacad # Set color of ls
export EDITOR=vim
export LANG=ja_JP.UTF-8

setopt auto_cd # cd-able without cd
setopt auto_pushd # cd-able to past directories by cd -[tab]
setopt correct # Correct wrong commands
setopt list_packed
setopt cdable_vars

PROMPT='%n%# '

bindkey -e # Emacs keybind on terminal

# Apply extracted files
source ~/.alias.zshrc
source ~/.git.zshrc
