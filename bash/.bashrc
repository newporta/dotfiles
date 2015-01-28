# Bash only reads this for a shell that's both interactive and non-login so it's mainly for
# customizing your actual shell

# some aliases
alias ret='RAILS_ENV=test'
alias cpcommit='git log -n 1 --format="[`git branch|grep \*|cut -c3-` %h] %s" | pbcopy'
alias be='bundle exec '
alias gs='git status -s'
alias gl='git log -10 | tee'
alias gp='git pull --rebase'
alias glp='git log -p --color-words'
alias glt='git log --oneline --graph --branches --decorate'
alias gco='git checkout'
alias m='mvim'
alias aspec='PS_MARKET=au be rspec'
alias au='PS_MARKET=au be'
alias nz='PS_MARKET=nz be'
alias spec='be rspec'
alias dbundle='ruby -I /Users/andy/Projects/bundler/lib /Users/andy/Projects/bundler/bin/bundle'

#colorise our bash shell
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

#set up our prompt - with bonus git branch notification
RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
WHITE="\[\033[1;37m\]"
BLACK="\[\033[0;30m\]"
GREY="\[\033[0;37m\]"

PS1="$BLACK# $WHITE\A $RED\w$YELLOW\$(__git_ps1) $GREEN\$$GREY\n"
