autoload -U compinit
compinit

setopt auto_pushd
setopt auto_cd
setopt correct
setopt cdable_vars

# ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias sl='ls'

alias b='bundle1.8'
alias bundle='b'
alias be='b exec'
alias bi='b install'
alias ber='be rspec'
alias e='exit'
alias g='git'
alias gi='git'
alias sc='screen -U'
alias r='rails1.8'
alias rake_db_seed='rake db:seed'
alias rake_db_migrate='rake db:migrate'
alias rake_db_migrate_test='rake db:migrate RAILS_ENV=test'
alias rds='rake_db_seed'
alias rdm='rake_db_migrate'
alias rdmt='rake_db_migrate_test'
alias up='cd ..'

PROMPT='%n@%m:%(5~,%-2~/.../%2~,%~)%# '
