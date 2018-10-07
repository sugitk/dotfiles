alias ls='ls -F'
alias df='df -h'

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

source /usr/local/etc/bash_completion.d/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
export PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
