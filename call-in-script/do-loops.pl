#!/usr/bin/env perl
use strict;
use warnings;

$ENV{SAC_DISPLAY_COPYRIGHT}=0;
open(SAC, "| sac ") or die "Error opening sac \n";
print SAC "echo on \n";
foreach (glob("*.SAC")) {
    print SAC "r more $_ \n";
}
print SAC "rmean \n";
print SAC "rtrend \n";
print SAC "lp co 1.0 p 2 n 4 \n";
print SAC "write append .filtered \n";
print SAC "quit \n";
close(SAC);
