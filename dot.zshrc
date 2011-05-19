# === Complement
# Command complemention e.g. ls -[tab] then list options
autoload -U compinit
compinit

# Colorize completion list e.g. ls [tab]
zstyle ':completion:*' list-colors 'di=36' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

# === Language
export LANG=ja_JP.UTF-8

# === History
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt hist_ignore_dups # Ignore duplicated command of history
setopt share_history # Share history between terminals by HISTFILE

# === Prompt
PROMPT='%n@%m:%(5~,%-2~/.../%2~,%~)%# '

# === Aliases
# lists
alias ls='ls -FG'
alias la='ls -A'
alias sl='ls'

# bundler
alias b='bundle'
alias be='bundle exec'
alias bi='bundle install'
alias ber='bundle rspec'

# rake
alias rake_seed='rake db:seed'
alias rake_migration='rake db:migrate:redo db:test:clone_structure'

# others
alias e='exit'
alias g='git'
alias j='jobs -l'
alias n='netstat -tuna'
alias p='ps auxxx'
alias r='rails'
alias s='svn'

alias du='du -h'
alias screen='screen -U'
alias up='cd ..'

# === Others
export LSCOLORS=gxfxcxdxbxegedabagacad # Set color of ls

setopt auto_cd # cd-able without cd
setopt auto_pushd # cd-able to past directories by cd -[tab]
setopt correct # Correct wrong commands
setopt list_packed
setopt cdable_vars
