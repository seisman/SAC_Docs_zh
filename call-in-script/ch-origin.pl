#!/usr/bin/env perl
use strict;
use warnings;

my ($year, $month, $day, $hour, $min, $sec, $msec)
    = (1981, 3, 28, 10, 23, 32, 456);

my $doy = &ymd2doy($year, $month, $day);

open(SAC, "| sac");
print SAC "echo on\n";
print SAC "r seis.SAC \n";
print SAC "ch o gmt $year $doy $hour $min $sec $msec\n";
print SAC "ch allt (0 - &1,o&) iztype IO \n";
print SAC "wh \n";
print SAC "q\n";
close(SAC);

sub ymd2doy {
    my ($year, $month, $day) = @_;
    my @noleap = qw ( 0 31 59 90 120 151 181 212 243 273 304 334 );
    my @leap   = qw ( 0 31 60 91 121 152 182 213 244 274 305 335 );

    if (($year%4 == 0 && $year%100 != 0) || ($year%400==0)){
        return $leap[$month-1]+$day;
    } else {
        return $noleap[$month-1]+$day;
    }
}
