#FirstRun 
if [ "$(who | grep -v tty | wc -l)" == '1' ]; then 
	./.screenlayout/layout.sh
	ssh-add ~dwalton/.ssh/id_rsa
fi

#Aliases 
alias grep="grep --color=auto";
alias egrep="egrep --color=auto";
alias ls="ls --color=auto";
alias ssh="ssh -v";
