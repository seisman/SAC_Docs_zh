#!/usr/bin/env perl
use strict;
use warnings;
use List::Util qw(min max);

@ARGV == 1 or die "Usage: perl $0 dirname\n";
my ($dir) = @ARGV;

chdir $dir;

# 利用hash的key的不可重复性构建集合:
#   hash的key定义为 NET.STA.LOC.CH (分量信息不是BHZ而是BH)
#   hash的value是文件名与key匹配的SAC文件数目，正常情况下是3的整数倍
my %sets;
foreach (glob "*.SAC") {
    my ($net, $sta, $loc, $chn) = split /\./;
    my $chn2 = substr $chn, 0, 2;
    $sets{"$net.$sta.$loc.$chn2"}++;
}

open(SAC, "|sac") or die "Error in opening sac\n";
# 对所有的key做循环
foreach my $key (keys %sets) {
    my ($E, $N, $Z, $R, $T, $Z0);

    # 检查Z分量是否存在
    $Z = "${key}Z.SAC";
    if (!-e $Z) {  # 若不存在，则删除该台站的所有数据
        warn "$key: Vertical component missing!\n";
        next;
    }

    # 检查水平分量是否存在
    if (-e "${key}E.SAC" and -e "${key}N.SAC") {   # E和N分量
        $E = "${key}E.SAC";
        $N = "${key}N.SAC";
    } elsif (-e "${key}1.SAC" and -e "${key}2.SAC") {  # 1和2分量
        $E = "${key}1.SAC";
        $N = "${key}2.SAC";
    } else {   # 水平分量缺失
        warn "$key: Horizontal components missing!\n";
        next;
    }

    # 检查水平分量是否正交
    my (undef, $cmpaz_E) = split m/\s+/, `saclst cmpaz f $E`;
    my (undef, $cmpaz_N) = split m/\s+/, `saclst cmpaz f $N`;
    my $cmpaz_delta = abs($cmpaz_E - $cmpaz_N);
    unless ((abs($cmpaz_delta - 90) <= 0.01) or (abs($cmpaz_delta - 270) <= 0.01)) {
        warn "$key: $E $N are not orthogonal!\n";
        next;
    }

    # 假定kzdate和kztime相同
    # 检查B, E, DELTA
    my (undef, $Zb, $Ze, $Zdelta) = split " ", `saclst b e delta f $Z`;
    my (undef, $Eb, $Ee, $Edelta) = split " ", `saclst b e delta f $E`;
    my (undef, $Nb, $Ne, $Ndelta) = split " ", `saclst b e delta f $N`;
    unless ( $Zdelta == $Edelta and $Zdelta == $Ndelta) {
        warn "$key: delta not equal!\n";
        next;
    }

    # 获取三分量里的最大B和最小E值作为数据窗
    my $begin = max($Zb, $Eb, $Nb) + $Zdelta;
    my $end = min($Ze, $Ee, $Ne) - $Zdelta;

    # 输出文件名为 NET.STA.LOC.[RTZ]
    my $prefix = substr $key, 0, length($key)-2;
    $R = $prefix."R";
    $T = $prefix."T";
    $Z0 = $prefix."Z";

    print SAC "cut $begin $end \n";
    print SAC "r $E $N \n";
    print SAC "rotate to gcp \n";
    print SAC "w $R $T \n";
    print SAC "r $Z \n";
    print SAC "w $Z0 \n";
}
print SAC "q\n";
close(SAC);
unlink glob "*.SAC";

chdir "..";
