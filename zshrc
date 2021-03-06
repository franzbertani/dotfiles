# If you come from bash you might have to change your $PATH.
export PATH=$PATH:$HOME/bin
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/usr/local/lib/ruby/gems/2.6.0/bin:$PATH"
export PATH="/usr/local/Cellar/gcc/8.3.0/libexec/gcc/x86_64-apple-darwin18.2.0/8.3.0:$PATH"

DEFAULT_USER=`whoami`

# enable colors and change prompt to [name folder]$ 
autoload -U colors && colors
PS1="%{$fg[blue]%}%~ %{$fg[yellow]%}➜ %{$reset_color%}"
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export LS_COLORS='di=1;36:ln=1;35:so=1;32:pi=1;33:ex=1;31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=34;43'

# history size and location
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt inc_append_history
setopt share_history

# cd
setopt auto_cd

# autocompletion
setopt auto_menu
setopt always_to_end
setopt complete_in_word
autoload -Uz compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' group-name ''
zmodload -i zsh/complist
typeset -i updated_at=$(date +'%j' -r ~/.zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)
if [ $(date +'%j') != $updated_at ]; then
    compinit -i
else
    compinit -C -i
fi

source ~/.aliases

export EDITOR="/usr/local/bin/nvim"
export SPARK_PATH=~/spark-2.2.0-bin-hadoop2.7
export SPARK_HOME=~/spark-2.2.0-bin-hadoop2.7


# virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
export VIRTUAL_ENV_DISABLE_PROMPT=1
export PIPENV_VERBOSITY=-1
[ -f /usr/local/bin/virtualenvwrapper_lazy.sh ] && source /usr/local/bin/virtualenvwrapper_lazy.sh



# for iterm2 statusbar
if [ $TERM = "xterm-256color" ]; then
    test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
    iterm2_print_user_vars() {
      iterm2_set_user_var virtualenv $(echo ${VIRTUAL_ENV:t})
    }
fi

# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=/Users/francesco/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# syntax highligting (brew install zsh-syntax-highlighting)
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# autosuggestions (brew install zsh-autosuggestions)
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/francesco/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/francesco/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/francesco/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/francesco/google-cloud-sdk/completion.zsh.inc'; fi
