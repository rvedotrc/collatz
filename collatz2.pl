#!/usr/bin/perl
# vi: set ts=4 sw=4 :

use warnings;
use strict;
use integer;

$| = 1;

# For each number in turn, "how can we arrive here"?
# Always either or or two incoming links.

# Transitions:
# x (odd) -goes-to-> y = 3x+1 (even)
# x (even) -goes-to-> y = x/2 (either)

# Therefore:
# y (either) -comes-from-> x = 2y (even)
# y (even) -comes-from-> x = (y-1)/3 (odd)

for (my $y=1; ; ++$y) {
	{
		my $x = 2*$y;
		print "$x -> $y\n";
	}

	{
		last if $y & 1;
		my $x = $y-1;
		last if $x % 3;
		$x /= 3;
		last if $x == 1;
		print "$x -> $y\n";
	}
}

# eof collatz2.pl
