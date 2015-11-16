#!/usr/bin/env perl
use strict;
use warnings;

my $str = "abcdefghi";

my $pos = index($str, "def");
my $len = length($str);
my $sub = substr($str, 2, 2);

print "$pos, $len, $sub \n";
