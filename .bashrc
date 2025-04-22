# ~/.bashrc: executed by bash(1) for non-login shells.

# --------------------------
# PATH and Environment Setup
# --------------------------
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin:$HOME/.istioctl/bin:$HOME/.local/bin:$HOME/.pyenv/bin:$HOME/.poetry/bin:$PATH"
export CLICOLOR=1
[ -f ~/.otherVars ] && source ~/.otherVars
export GPG_TTY=$(tty)

# --------------------------
# SSH Agent Auto-Reuse
# --------------------------
agent_env_file="$HOME/.ssh/agent.env"

if [ -f "$agent_env_file" ]; then
    source "$agent_env_file" > /dev/null 2>&1
    if ! kill -0 "$SSH_AGENT_PID" 2>/dev/null; then
        echo "Stale SSH agent. Removing $agent_env_file."
        rm -f "$agent_env_file"
    fi
fi

if [ ! -f "$agent_env_file" ]; then
    echo "Starting new SSH agent..."
    ssh-agent > "$agent_env_file"
    chmod 600 "$agent_env_file"
    source "$agent_env_file" > /dev/null 2>&1
fi

# Uncomment this line if you want to auto-add a key
#[ -f ~/.ssh/id_rsa ] && ssh-add -l &>/dev/null || ssh-add ~/.ssh/id_rsa &>/dev/null

# --------------------------------------
# If not running interactively, don't continue
# --------------------------------------
case $- in
    *i*) ;;
      *) return;;
esac

# --------------------------
# History Settings
# --------------------------
HISTCONTROL=ignoreboth
HISTSIZE=100000
HISTFILESIZE=200000
shopt -s histappend
shopt -s checkwinsize

# --------------------------
# Lesspipe
# --------------------------
command -v lesspipe >/dev/null && eval "$(SHELL=/bin/sh lesspipe)"

# --------------------------
# Debian chroot info
# --------------------------
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# --------------------------
# Git Branch in Prompt (Color Safe)
# --------------------------
parse_git_branch() {
  git rev-parse --abbrev-ref HEAD 2>/dev/null | sed 's/.*/ (\0)/'
}

if command -v tput >/dev/null && tput setaf 1 >&/dev/null; then
  color_prompt=yes
else
  color_prompt=
fi

if [ "$color_prompt" = yes ]; then
  PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:'\
'\[\033[01;34m\]\w\[\033[33m\]$(parse_git_branch)\[\033[00m\]\$ '
else
  PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w$(parse_git_branch)\$ '
fi

case "$TERM" in
  xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
esac

# --------------------------
# Colors and Aliases
# --------------------------
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias j='jobs -l'
alias which='type -a'
alias ..='cd ..'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ssh='ssh -v'
alias ls='ls --color=always'
alias path='echo -e ${PATH//:/\\n}'
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'
alias pca='pre-commit run --all-files'
alias tg='terragrunt'
alias tf='terraform'
alias kc='kubectl'

# --------------------------
# Custom Aliases File
# --------------------------
[ -f ~/.bash_aliases ] && . ~/.bash_aliases

# --------------------------
# Bash Completion
# --------------------------
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# --------------------------
# Node Version Manager
# --------------------------
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
