#!/usr/bin/env perl
use strict;
use warnings;

foreach my $file (glob "*.SAC") {
    my @item = split /\./, $file;
    rename $file, "$item[6].$item[7].$item[9]";
}
