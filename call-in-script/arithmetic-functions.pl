#!/usr/bin/env perl
use strict;
use warnings;
use Math::Trig;
$ENV{SAC_DISPLAY_COPYRIGHT}=0;

my $var1 = (1+2)*3/4;
open(SAC, "| sac") or die "Error in opening sac\n";
print SAC "fg seis \n";
print SAC "rmean; rtr; taper \n";
my $var2 = sqrt(9);
my $var3 = sin(30*pi/180);
print SAC "bp c $var3 $var1 \n";
print SAC "q \n";
close(SAC);
