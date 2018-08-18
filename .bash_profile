# https://github.com/git/git/blob/master/contrib/completion/git-completion.bash
source ~/bin/git-completion.bash
# https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
source ~/bin/git-prompt.sh

export GIT_PS1_SHOWDIRTYSTATE=true

export CLICOLOR=1
#export LSCOLORS=GxFxCxDxBxegedabagaced
export PATH="/usr/local/sbin:$PATH"
export PS1=$'\[\e[0;36m\]\W\[\e[0m\]$(__git_ps1) \[\e[0;36m\]\xee\x82\xb0\[\e[0m\] '
#export PS1="\h:\W \u\$ "

export TERM=xterm-256color-italic

source ~/.aliases

#settings for spark
export SPARK_PATH=~/spark-2.2.0-bin-hadoop2.7
export SPARK_HOME=~/spark-2.2.0-bin-hadoop2.7

#For python 3, You have to add the line below or you will get an error
#export PYSPARK_PYTHON=python3
