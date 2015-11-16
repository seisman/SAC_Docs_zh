#!/usr/bin/env perl
use strict;
use warnings;

foreach my $file (glob "*.SAC") {
    my ($year, $jday, $hour, $min, $sec, $msec,
                    $net, $sta, $loc, $chn, $q, $suffix) = split /\./, $file;
    rename $file, "$net.$sta.$loc.$chn";
}
