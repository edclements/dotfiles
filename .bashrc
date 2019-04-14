
# Check for an interactive session
[ -z "$PS1" ] && return

PS1='[\u@\h \W]\$ '

alias vi='vim'
alias sudo='sudo -E '

# humanize
alias df='df -h'
alias du='du -h'

# colour
if command -v dircolors >/dev/null; then
  alias ls='ls --color=auto'
  export GREP_COLOR="1;33"
  alias grep='grep --color=auto'
  eval $(dircolors -b)
else
  export CLICOLOR=1
fi

# safety features
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# defaults
export EDITOR=vim
export BROWSER=google-chrome-stable

export LANG=en_GB.UTF-8

export PATH=$PATH:$HOME/bin
export PATH=$PATH:/usr/sbin
export PATH=$PATH:/sbin
export PATH=$PATH:/opt/java/bin
export PATH=$PATH:/opt/java/jre/bin
export PATH=$PATH:/opt/android-sdk/tools
export PATH=$PATH:/opt/android-sdk/platform-tools
export PATH=$PATH:/usr/share/java/apache-ant/bin
export PYTHONPATH=$PYTHONPATH:$HOME/python

# csound
export OPCODEDIR64=/usr/lib/csound/plugins64
export CSSTRINGS=/usr/share/locale
export SFDIR=/tmp/sfdir

# audio tweaks
export CONFIG_NO_HZ=n
export CONFIG_HZ_1000=y
export CONFIG_APM=n

# golang
export GOROOT=/usr/lib/go
export GOPATH=$HOME/go

# fuzzy finder
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# rbenv
# export RBENV_ROOT="$HOME/.rbenv"
# PATH="$RBENV_ROOT/bin:$PATH"
# eval "$(rbenv init -)"

# ruby
[ -f /usr/share/chruby/chruby.sh ] && source /usr/share/chruby/chruby.sh
[ -f /usr/share/chruby/auto.sh ] && source /usr/share/chruby/auto.sh

# git safe
PATH=".git/safe/../../bin:$PATH"

for file in $HOME/.bashrc.d/*; do
  source "$file"
done
