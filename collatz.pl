#!/usr/bin/perl
# vi: set ts=4 sw=4 :

use warnings;
use strict;
use integer;

my %done;

# For each number in turn, iterate until we reach one (or some other that we
# know eventually reaches one).

for (my $i=1; ; ++$i)
{
	my $j = $i;
	next if $done{$j};
	print "$j";
	while ($j != 1) {
		my $k = (($j & 1) ? $j*3+1 : $j/2);
		last if $done{$j}++;
		print " -> $k";
		$j = $k;
	}
	print "\n";
}

# eof collatz.pl
