#!/usr/bin/env perl
#@author: Stewart Johnston
#Stupid script to find the maximum times any given line is repeated.

use v5.20;

sub main{
	open(my $fh, "<", "./Capture3-port_convos");
	my $max_dupes = 0;
	my $candidate_dupes = 0;
	my $prior_line = "";
	while(my $line = readline($fh)){
		if ($line eq $prior_line){
			$candidate_dupes += 1;
		}
		else { 
			if ($candidate_dupes > $max_dupes){
				$max_dupes = $candidate_dupes;
				say("New maximum is: $max_dupes");
			}
			$candidate_dupes = 0;
		}

		$prior_line = $line;
	}
	say("Maximum retries is: $max_dupes");
}

main();
