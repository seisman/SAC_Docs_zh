#!/usr/bin/env perl
use strict;
use warnings;
$ENV{SAC_DISPLAY_COPYRIGHT}=0;

my $seed = "2013_04_22_01_16_00.100468.seed";
&merge($seed);

sub merge{
    my ($seedfile) = @_;
    # 使用rdseed -c选项从SEED文件中提取信息
    open(LIST, "rdseed -cf $seedfile |") or die "can't open rdseed\n";
    my @list = <LIST>;
    close(LIST);

    # 跳过信息中无用的部分
    while (my $line = shift @list){
        last if $line =~ /Sta\s+Loc\s+Chn\s+Net/;
    }

    # 对有用的信息做循环
    foreach my $line (@list) {
        my @item = split " ", $line;
        last if $item[0] eq "#";       # The last records

        my ($net, $sta, $chn, $loc);

        # 若LOC为空，则一行有11列
        # 若LOC有值，则一行有12列
        # 因而需要对列数做判断，以提取NET, STA, LOC, CHN信息
        if (@item == 12) {
            ($net, $sta, $chn, $loc) = ($item[4], $item[1], $item[3], $item[2]);
        } elsif (@item == 11) { # empty LOC
            ($net, $sta, $chn, $loc) = ($item[3], $item[1], $item[2], "")
        } else {
            die "Error parser lines.\n"
        }

        my @files = glob "*.$net.$sta.$loc.$chn.?.SAC";

        if (@files == 1) {  # 一个文件，无需merge
            next;
        } elsif (@files > 1) { # 多个文件，需要merge
            # 以下代码仅限于SAC v101.6之后的版本
            open(SAC, "|sac");
            print SAC "wild echo off\n";
            print SAC "r *.$net.$sta.$loc.$chn.?.SAC \n";
            print SAC "merge \n";
            print SAC "w $files[0] \n";
            print SAC "q \n";
            close(SAC);
            shift @files;   # remove first file from list
            unlink @files;
        } elsif (@files == 0) {
            print STDERR "## No SAC file found for $net.$sta.$loc.$chn\n";
        }
    }
}
