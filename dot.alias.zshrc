# ----------------------------------------------------------------------
# Normal
# ----------------------------------------------------------------------
alias b='bundle'
alias be='bundle exec'
alias bi='bundle install'
alias bo='bundle open'

alias c='coffee'
alias cof='coffee'

alias du='du -h'

alias e='exit'

alias g='git'

alias h='cd ~' # to Home

alias j='jobs -l'

alias la='ls -A'
alias ls='ls -FG'

alias n='netstat -tuna'

alias p='ps auxxx'

alias r='rails'
alias rc='rails c'
alias reload='source ~/.zshrc'
alias rk='rake'
alias rkcu='rake cucumber'
alias rkrs='rake db:drop && rake db:drop RAILS_ENV=test && rake db:create db:migrate && rake db:test:clone_structure' # ReSet
alias rksd='rake db:seed'
alias rksp='rake spec'
alias rkt='rake spec cucumber' # Test all
alias ro='vim - -R' # Read Only
alias rs='rails s'

alias s='svn'
alias sc='screen -U'
alias screen='screen -U'
alias sl='ls' # Hedge typo
alias ss='socketstream'

alias u='cd ..' # Up
alias up='cd ..'

alias v='vim'

# ----------------------------------------------------------------------
# Global
# ----------------------------------------------------------------------
alias -g G='| grep'
alias -g H='| head'
alias -g L='| less'
alias -g T='| tail'
