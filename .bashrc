#FirstRun 
if [ "$(who | grep -v tty | wc -l)" == '1' ]; then 
	if [ -f ~dwalton/.screenlayout/layout.sh ]; then
		./.screenlayout/layout.sh
	fi
	if [ "$(ssh-add -L)" == 'The agent has no identities.' ]; then	
		ssh-add ~dwalton/.ssh/id_rsa
	fi
fi

if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

#Aliases 
alias grep="grep --color=auto";
alias egrep="egrep --color=auto";
alias ls="ls --color=auto";
alias ssh="ssh -v";

#Other settings. 
HISTFILESIZE=100000

PATH="/home/dwalton/perl5/bin${PATH+:}${PATH}"; export PATH;
PERL5LIB="/home/dwalton/perl5/lib/perl5${PERL5LIB+:}${PERL5LIB}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/dwalton/perl5${PERL_LOCAL_LIB_ROOT+:}${PERL_LOCAL_LIB_ROOT}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/dwalton/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/dwalton/perl5"; export PERL_MM_OPT;
