#!/usr/bin/perl

use strict;
use warnings;
use diagnostics;

my @choices = qw( a b c d e f 1 2 3 4 5 6 7 8 9 0 );
my $counter = 12;
my $counter2 = 1;
my @mac;

while ($counter > 0) { 
	my $num = int(rand(15));
	my $entry = $choices[$num];
	push @mac, $entry;
	$counter -= 1;
}

foreach my $bar (@mac) { 
	if ( $counter2 eq 1 ) {
		print $bar;
		$counter2 += 1;
		$counter +=1; 
	} else { 
		if ($counter eq 11 ) { 
			print "$bar\n";
		} else {
			print "$bar:";
			$counter2 = 1;
			$counter += 1;
		}
	}
}
