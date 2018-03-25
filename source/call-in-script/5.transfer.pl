#!/usr/bin/env perl
use strict;
use warnings;
$ENV{SAC_DISPLAY_COPYRIGHT} = 0;

@ARGV == 1 or die "Usage: perl $0 dirname\n";
my ($dir) = @ARGV;

chdir $dir;

open(SAC, "| sac") or die "Error in opening sac\n";
foreach my $sacfile (glob "*.SAC") {
    my ($net, $sta, $loc, $chn) = split /\./, $sacfile;

    # 找到对应的PZ文件
    # PZ文件名为: SAC_PZs_NET_STA_CHN_LOC_BeginTime_EndTime
    my @pz = glob "SAC_PZs_${net}_${sta}_${chn}_${loc}_*_*";
    die "PZ file error for $sacfile \n" if @pz != 1;

    print SAC "r $sacfile \n";
    print SAC "rmean; rtr; taper \n";
    print SAC "trans from pol s $pz[0] to none freq 0.01 0.02 5 10\n";
    print SAC "mul 1.0e9 \n";
    print SAC "w over\n";
}
print SAC "q\n";
close(SAC);

chdir "..";
