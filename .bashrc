
# Check for an interactive session
[ -z "$PS1" ] && return

PS1='[\u@\h \W]\$ '

alias ls='ls --color=auto'
alias vi='vim'
alias sudo='sudo -E '
alias grep='grep --color=auto'
alias df='df -h'
alias du='du -h'

# safety features
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

export EDITOR=vi
export LANG=en_GB

export PATH=$PATH:$HOME/bin
export PATH=$PATH:/usr/sbin
export PATH=$PATH:/sbin
export PATH=$PATH:/opt/java/bin
export PATH=$PATH:/opt/java/jre/bin
export PYTHONPATH=$PYTHONPATH:$HOME/python

# csound
export OPCODEDIR64=/usr/lib/csound/plugins64
export CSSTRINGS=/usr/share/locale

# audio tweaks
export CONFIG_NO_HZ=n
export CONFIG_HZ_1000=y
export CONFIG_APM=n

export GREP_COLOR="1;33"
