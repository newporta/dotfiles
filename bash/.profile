# This is the logon script

#Make git use vim for it's commit/rebase
export EDITOR="vim -f"
export SHELL="/bin/bash"
export GOPATH="/Users/andy/projects/go"
export TERRAFORM_PATH="/usr/local/opt/terraform@0.11/bin"
export PYTHON_BINS="/Users/newportandy/Library/Python/3.8/bin"
export PATH=$TERRAFORM_PATH:$PYTHON_BINS:/Users/andy/bin:/usr/local/share/npm/bin:/Users/andy/scripts:/usr/local/sbin:/usr/local/bin:/Applications/Xcode.app/Contents/Developer/usr/bin:$PATH:$GOPATH/bin

#Add some helpful scripts
export PATH="$HOME/.scripts:$PATH"

# Add cargo bin path
export PATH="$HOME/.cargo/bin:$PATH"

# Add .local to path for stack
export PATH="$HOME/.local/bin:$PATH"

# export our bashrc so aliases are setup
[ -r ~/.bashrc ] && source ~/.bashrc

# nvm - via brew
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

# rbenv
export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi


export PYENV_ROOT="$HOME/.pyenv"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Add GHC 7.8.2 to the PATH, via http://ghcformacosx.github.io/
export GHC_DOT_APP="/Applications/ghc-7.8.2.app"
if [ -d "$GHC_DOT_APP" ]; then
    export PATH="${HOME}/.cabal/bin:${GHC_DOT_APP}/Contents/bin:${PATH}"
fi

# Get me some completions!!!!
if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi
if [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
    . /usr/local/etc/bash_completion.d/git-completion.bash
fi
if [ -f /usr/local/etc/bash_completion.d/git-prompt.sh ]; then
    . /usr/local/etc/bash_completion.d/git-prompt.sh
fi

function console {
  if [ -z $1 ]; then echo "REQUIRES ARGS, DUH...";  return; fi;

  local __file=("./config/deploy/$1")
  if [ -f $__file ]; then
    local __server=$(grep primary $__file | cut -d ',' -f 2 | tr -d " \"")
    echo "Connecting to $__server"
    ssh $__server -t "cd /apps/*/current && script/rails c production"
  else
    echo "No couldn't find file for: $1, tried $__file"
  fi
}

# Launch vim, jump to line if there's a colon
#function m {
  #if [[ -n $1 &&  $1 =~ ":" ]]; then
    #vim +$(echo $1  | cut -d : -f 2) $(echo $1  | cut -d : -f 1)
  #else
    #vim $@
  #fi
#}
