#!/usr/bin/perl
#################################################################################
# By: Derrick Walton								#
# You will need to install sshpass in order to use this script. Also I suggest  #
# You make a list, in this case 'clean' to house your ip, user, password, and   #
# hostname. EX. 								#
# host1 10.0.0.1 root passw0rd!							#
#################################################################################


use strict; 
use warnings; 
use diagnostics; 

#setting filename
my $filename='clean';

#open file. 
open my $file , '<', $filename 
	or die "Can't open $filename for writing";

# This actuall does all of the work. 
while (my $line = <$file>) {  
	chomp($line);
	my ( $host, $ip, $user, $pass ) = split / /, $line;
	print "Connecting to $host\n";
	#for those of you using ssh keys. 
	#system("ssh $user\@$ip ' w; hostname; echo ;  free -m; echo ; grep proc /proc/cpuinfo | wc -l; echo ;'");
	system("sshpass -p'$pass' ssh $user\@$ip ' w; hostname; echo ;  free -m; echo ; grep proc /proc/cpuinfo | wc -l; echo ;'");
	print "####################################################################\n";
}


close $file or die "Unable to close $filename"; 

