#!/usr/bin/perl
use strict;
use warnings;
use diagnostics;
my @choices = qw( 0 1 2 3 4 5 6 7 8 9 A B C D E F );
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

#The revised way of doing all of this stuff. 
my %mac2;
$counter = 0; 
foreach my $foo (0..15){
	foreach my $bar (0..15){
		$mac2{$counter} = "$choices[$foo]$choices[$bar]";
		$counter += 1;
	}
}

foreach my $foo (0..5) { 
	$counter =int(rand(255));
	if ($foo lt 5) { 
		print "$mac2{$counter}:";
	} else { 
		print "$mac2{$counter} \n";
	}
} 

