# ----------------------------------------------------------------------
# Normal
# ----------------------------------------------------------------------
alias b='bundle'
alias be='bundle exec'
alias bi='bundle install'
alias bo='bundle open'

alias c='coffee'
alias cof='coffee'
alias ccm='cucumber'

alias du='du -h'

alias e='exit'

alias f='find'

alias g='git'

alias h='cd ~' # to Home

alias j='jobs -l'

alias l='ls'
alias la='ls -A'
alias ll='ls -l'
alias ls='ls -FG'

alias n='netstat -tuna'

alias o='open'

alias p='ps auxxx'

alias r='rails'
alias rc='rails c'
alias reload='source ~/.zshrc'
alias rk='rake'
alias rkcu='rake cucumber'
alias rkcuw='rake cucumber:wip'
alias rkrs='rake db:drop && rake db:drop RAILS_ENV=test && rake db:create db:migrate db:test:clone_structure db:seed' # ReSet
alias rksd='rake db:seed'
alias rksp='rake spec'
alias rkt='rake spec cucumber' # Test all
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
# http://d.hatena.ne.jp/mollifier/20100317/p1
if which pbcopy >/dev/null 2>&1 ; then
  # Mac
  alias -g C='| pbcopy'
elif which xsel >/dev/null 2>&1 ; then
  # Linux
  alias -g C='| xsel --input --clipboard'
elif which putclip >/dev/null 2>&1 ; then
  # Cygwin
  alias -g C='| putclip'
fi

alias -g G='| grep'
alias -g H='| head'
alias -g L='| less'
alias -g S='| sort'
alias -g T='| tail'
alias -g V='| view - -R'
alias -g VR='| view - -R'
