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
alias rkrs='rake db:drop && rake db:drop RAILS_ENV=test && rake db:create db:migrate && rake db:test:clone_structure' # ReSet

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

alias reload='source ~/.zshrc'

alias s='svn'

alias sc='screen -U'
alias screen='screen -U'

alias v='vim'

alias up='cd ..'
