# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/karanja/.oh-my-zsh

# Autocomplete plugin
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="re5et"
DISABLE_AUTO_UPDATE="true"

COMPLETION_WAITING_DOTS="true"
plugins=(git zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
fi
# Custom aliases and commands
#Venv wrappers exports

PYTHONPATH=/Library/Frameworks/Python.framework/Versions/2.7/bin:$PATH
export PYTHONPATH
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
export WORKON_HOME=~/projects/envs
# export GOPATH=~/go
source /usr/local/bin/virtualenvwrapper.sh
#Python stuff
alias mvnv="mkvirtualenv -p /usr/local/bin/python3"
alias wkn="workon"
alias mvnv2="mkvirtualenv -p /usr/bin/python2"
alias dvnv="deactivate"

#system aliases
alias .="source"
alias v="vim"
alias rsp="bundle exec rspec"
alias mdr="mkdir -p"
alias k="kill -9"
alias rm="trash"
alias zzz='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'

# shortcuts
alias an="cd /Users/karanja/projects/andela"
alias as="cd /Users/karanja/projects/alphaSights"
alias cw="cd /Users/karanja/projects/clientWork"
alias os="cd /Users/karanja/projects/openSource"
alias pp="cd /Users/karanja/projects/personalProjects"
alias tt="cd /Users/karanja/projects/tuts"

#git aliases
alias gi="git init"
alias gb="git branch"
alias gp="git push origin"
alias glg="git log --oneline"
alias gmm="git merge master"
alias gmd="git merge develop"

# rails stuff
alias b="bundle install && bundle"
alias be="bundle exec"
alias rg="rails g"
alias rd="rails d"
alias rgc="rails g controller"
alias rdc="rails d controller"
alias rgm="rails g model"
alias rdm="rails d model"
alias rdbm="rails db:migrate"
alias rdbd="rails db:drop"
alias rdbc="rails db:create"
alias rdbr="rails db:rollback"
alias rdbs="rails db:setup"
alias rtdb="bin/rails db:environment:set RAILS_ENV=test; RAILS_ENV=test bundle exec rails db:drop db:create db:migrate db:reload_views"
alias rs="rails s -b 0.0.0.0 -p"
alias rst="RAILS_ENV=test rails s -b 0.0.0.0 -p"
alias rc="rails c"
alias st="RAILS_ENV=test rails db:seed"
alias s="rails db:seed"
alias ru="bundle exec rubocop"
alias rvc="rvm  gemset create"
alias rvu="rvm gemset use"
alias rvl="rvm gemset list"

# JS/Yarn stuff
alias y="yarn"
alias ys="yarn start"
alias yt="yarn test"

# Ember stuff
alias es="ember s"
alias eg="ember generate"
alias ed="ember d"
alias et="ember t -s"
alias ei="ember install"

# RabbitMQ
alias rabbit-clear="/usr/local/sbin/rabbitmqadmin -f tsv -q list queues name | while read queue; do /usr/local/sbin/rabbitmqadmin -q delete queue name=${queue}; done"

#Auoenv Sh**
source $(brew --prefix autoenv)/activate.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# export JAVA_HOME=$(/usr/libexec/java_home)

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
