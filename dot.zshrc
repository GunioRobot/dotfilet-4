# === Complement
# Command complemention e.g. ls -[Tab] then list options
autoload -U compinit
compinit

# === Language
export LANG=en_US

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
alias l='ls -CF'
alias ll='ls -alF'
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
alias du='du -h'
alias e='exit'
alias g='git'
alias r='rails'
alias s='svn'
alias screen='screen -U'
alias up='cd ..'

# === Others
setopt auto_cd # cd-able without cd
setopt auto_pushd # cd-able to past directories by cd -[tab]
setopt correct # Correct wrong commands
setopt list_packed
setopt cdable_vars
