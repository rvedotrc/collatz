#!/usr/bin/perl
# vi: set ts=4 sw=4 :

use warnings;
use strict;
use Math::BigInt;

$| = 1;

# Iterate out ways of reaching 1.
my @q = ( [ 0, Math::BigInt->new(1) ] );

# Always either or or two incoming links.

# Transitions:
# x (odd) -goes-to-> y = 3x+1 (even)
# x (even) -goes-to-> y = x/2 (either)

# Therefore:
# y (either) -comes-from-> x = 2y (even)
# y (even) -comes-from-> x = (y-1)/3 (odd)

while (my $e = shift @q) {
	my ($level, $y) = @$e;

	{
		my $x = 2*$y;
		print "$x -> $y // $level \n";
		push @q, [ $level+1, $x ];
	}

	{
		last if $y & 1;
		my $x = $y-1;
		last if $x % 3;
		$x /= 3;
		last if $x == 1;
		print "$x -> $y // $level \n";
		push @q, [ $level+1, $x ];
	}
}

# eof collatz3.pl
