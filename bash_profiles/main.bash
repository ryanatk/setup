export GREP_OPTIONS='--color=auto'
export GREP_COLORS='fn=16'

# Git tab completion
source ~/.git-completion.sh
source ~/.git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWSTASHSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
PS1='\[\033[1;33m\]\u\[\033[0m\]@\[\033[1;33m\]$profile_name \[\033[0m\]\w\[\033[1;33m\]$(__git_ps1 " %s")\[\033[0m\] \$ '

# command line tool aliases
alias vim='vim -p'
alias ls="ls -G"
alias ll='ls -alF'
alias la='ls -A'
alias lc='ls -CF'
alias gr='grep -r'
alias fin='find . -name'
alias myip='ipconfig getifaddr en0'
alias myipwireless='ipconfig getifaddr en1'
alias fuckjava='killall -9 java'

# git command aliases
alias gst='git status'
alias gchange='git whatchanged -p --'

# file locations
alias ehosts='sudo vi /etc/hosts'
alias ebash='vim ~/.setup/bash_profiles/'
alias ebashes='vim ~/.setup/bash_profiles/*'
alias rbash='. ~/.bash_profile'
alias evimrc='vim ~/.vimrc'

# ssh
alias sshryan='ssh ryan@74.207.233.20'
alias sshroot='ssh root@74.207.233.20'
alias cweb='cd ~/web'
