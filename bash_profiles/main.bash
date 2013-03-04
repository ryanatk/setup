# Git tab completion
source ~/.git-completion.sh
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWSTASHSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
PS1='\[\033[1;33m\]\u\[\033[0m\]@\[\033[1;33m\]$profile_name \[\033[0m\]\w\[\033[1;33m\]$(__git_ps1 " %s")\[\033[0m\] \$ '

# git command aliases
alias gst='git status'
alias gchange='git whatchanged -p --'

# Personal customizations
alias ehosts='sudo vi /etc/hosts'
alias ebash='vim ~/.setup/bash_profiles/'
alias rbash='. ~/.bash_profile'
alias evimrc='vim ~/.vimrc'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias gr='grep -r'
alias vim='vim -p'

# ssh
alias sshryan='ssh ryan@74.207.233.20'
alias sshroot='ssh root@74.207.233.20'

alias ccamp='cd ~/web/campanyon/'
