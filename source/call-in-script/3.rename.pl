#!/usr/bin/env perl
use strict;
use warnings;

@ARGV == 1 or die "Usage: perl $0 dirname\n";
my ($dir) = @ARGV;

chdir $dir;

foreach my $file (glob "*.SAC") {
    my ($net, $sta, $loc, $chn) = (split /\./, $file)[6..9];
    rename $file, "$net.$sta.$loc.$chn.SAC";
}

chdir "..";
