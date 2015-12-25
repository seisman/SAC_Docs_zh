#!/usr/bin/env perl
use strict;
use warnings;

@ARGV == 2 or die "Usage: perl $0 dirname [delta | 0]\n";
#若第二个参数为0，则取数据中出现次数最多的周期为采样周期

my ($dir, $delta) = @ARGV;

chdir $dir;

if ($delta == 0) {
    # 假定所有数据已旋转到RTZ坐标系，文件名格式为NET.STA.LOC.[RTZ]
    # hash的键为出现了的采样周期，其值为出现的个数
    my %group;
    foreach (glob "*.*.*.[RTZ]") {
        my (undef, $delta0) = split /\s+/, `saclst delta f $_`;
        $group{$delta0}++;
    }
    # 将hash按value排序，找到最大value所对应的key
    my @keys = sort {$group{$b} <=> $group{$a}} keys %group;
    ($delta) = @keys;
}

# 重采样
open(SAC, "|sac") or die "Error in opening sac\n";
foreach (glob "*.*.*.[RTZ]") {
    my (undef, $delta0) = split /\s+/, `saclst delta f $_`;
    next if $delta == $delta0;  # 不需要重采样

    print SAC "r $_ \n";
    # 用interpolate实现减采样或增采样
    # 若是减采样，则需要对数据做低通滤波以防止出现混淆效应
    # 低通滤波时或许需要加上p 2以避免滤波引起的相移
    printf SAC "lp c %f\n", 0.5/$delta if $delta > $delta0;
    print SAC "interpolate delta $delta \n";

    print SAC "w over\n";
}
print SAC "q\n";
close(SAC);

chdir "..";
