#!/usr/bin/env perl
use strict;
use warnings;
$ENV{SAC_DISPLAY_COPYRIGHT}=0;

open(SAC, "| sac ") or die "Error opening sac\n";
print SAC "fg seismo \n";
print SAC "lh evla kstnm \n";
print SAC "q \n";
close(SAC);
