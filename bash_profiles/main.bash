export GREP_OPTIONS='--color=auto'
export GREP_COLORS='fn=16'
export EDITOR=vim

# Git tab completion
source ~/.git-completion.sh
source ~/.git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWSTASHSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
PS1='\[\033[1;33m\]\u\[\033[0m\]@\[\033[1;33m\]$profile_name \[\033[0m\]\w\[\033[1;33m\]$(__git_ps1 " %s")\[\033[0m\] \$ '

# command line tool aliases
set -o vi
alias vim='vim -p'
alias ls="ls -G"
alias ll='ls -alF'
alias la='ls -A'
alias lc='ls -CF'
alias gr='fgrep -R -I -n --exclude-dir=node_modules --exclude=*.log'
#this doesnt work. make it work.
alias vgr='vim -p `fgrep -R -l --exclude-dir=node_modules --exclude=*.log --exclude=*.p.* $1 *`'
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
alias sshryanatk='ssh root@198.199.114.117'
alias cweb='cd ~/web'

# aws
# curl -O https://s3.amazonaws.com/zappos-aws-workshop/aws.zip; unzip aws.zip; rm aws.zip; mv aws ~/.aws
export AWS_CONFIG_FILE=~/.aws/aws_config_file
export EC2_HOME=~/.aws/ec2-api-tools-1.6.7.1
export PATH=$PATH:$EC2_HOME/bin:~/.aws/AWS-ElasticBeanstalk-CLI-2.3.1/eb/macosx/python2.7
