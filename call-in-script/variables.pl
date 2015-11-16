#!/usr/bin/env perl
use strict;
use warnings;
$ENV{SAC_DISPLAY_COPYRIGHT}=0;

open(SAC, "| sac ") or die "Error opening sac\n";
print SAC "fg seismo \n";
print SAC "ch kuser0 &1,kevnm& \n";
my $tmp = "ABC";                # Perl中的变量
print SAC "ch kuser1 $tmp \n";
print SAC "lh kuser0 kuser1 \n";
print SAC "quit \n";
close(SAC);
