# === Complement
# Command complemention e.g. ls -[Tab] then list options
autoload -U compinit
compinit

# Predict command; studies inputted commands
autoload predict-on
predict-on

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
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias sl='ls'

# bundler
alias b='bundle1.8'
alias be='b exec'
alias bi='b install'
alias ber='be rspec'
alias bu='bundle'
alias bue='bundle exec'
alias bui='bundle install'

# rails
alias r='rails1.8'
alias ra='rails'

# rake
alias rake_db_seed='rake db:seed'
alias rake_db_migrate='rake db:migrate:redo db:test:clone_structure'
alias rake_db_migrate_test='rake db:migrate RAILS_ENV=test'
alias rds='rake_db_seed'
alias rdm='rake_db_migrate'
alias rdmt='rake_db_migrate_test'

# others
alias e='exit'
alias g='git'
alias gi='git'
alias s='svn'
alias sc='screen -U'
alias up='cd ..'

# === Others
setopt auto_cd # cd-able without cd
setopt auto_pushd # cd-able to past directories by cd -[tab]
setopt correct # Correct wrong commands
setopt list_packed
setopt cdable_vars
