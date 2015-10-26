#FirstRun 
if [ "$(who | grep -v tty | wc -l)" == '1' ]; then 
	if [ -f ~dwalton/.screenlayout/layout.sh ]; then
		./.screenlayout/layout.sh
	fi
	if [ "$(ssh-add -L)" == 'The agent has no identities.' ]; then	
		ssh-add ~dwalton/.ssh/id_rsa
	fi
fi

#Aliases 
alias grep="grep --color=auto";
alias egrep="egrep --color=auto";
alias ls="ls --color=auto";
alias ssh="ssh -v";
