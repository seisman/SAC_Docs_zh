#!/usr/bin/env perl
use strict;
use warnings;
$ENV{SAC_DISPLAY_COPYRIGHT} = 0;

open(SAC, "|sac") or die "Error in opening sac\n";
foreach my $sacfile (glob "*.BH?") {
    # 假设SAC文件名格式为: NET.STA.LOC.CHN
    my ($NET, $STA, $LOC, $CHN) = split /\./, $sacfile;

    # 寻找匹配的PZ文件: SAC_PZs_NET_STA_CHN_LOC_StartTime_EndTime
    my @PZ = glob "SAC_PZs_${NET}_${STA}_${CHN}_${LOC}_*_*";
    die "PZ file error for $sacfile \n" if @PZ != 1;
    my $pzfile = $PZ[0];

    # 去仪器响应
    print SAC "r $sacfile \n";
    print SAC "rmean; rtr; taper \n";
    print SAC "trans from pol s $pzfile to none freq 0.01 0.02 5 10\n";
    print SAC "mul 1.0e9 \n";
    print SAC "w over\n";
}
print SAC "q\n";
close(SAC);
