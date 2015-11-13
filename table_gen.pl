#!/usr/bin/perl
use diagnostics;
use warnings;
use strict;

print "|Block Storage IP|Company Name|Company ID| host| hostip| physical| \n"; 

foreach my $foo (0..3){ 
	foreach my $bar (0..255){
		print "|10.30.$foo.$bar|Unused IP| | | | | \n";
	}
}
