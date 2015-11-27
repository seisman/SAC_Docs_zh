#!/usr/bin/env perl
use strict;
use warnings;

@ARGV == 1 or die "Usage: perl $0 dirname\n";
my ($dir) = @ARGV;

chdir $dir;  # cd进数据所在目录，以避免处理路径

my @seed = glob "*.seed";
# rdseed一次只能处理一个SEED文件
die "One and only one SEED file is needed!\n" if @seed != 1;
system "rdseed -pdf @seed";

chdir "..";
