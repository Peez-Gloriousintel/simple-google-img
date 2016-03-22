#!/usr/bin/perl

use warnings;
use GoImgMod;

die "Usage: $0 [-s:path] [-n:number_of_results] <keyword>\n" if (@ARGV < 1 or @ARGV > 3);
my $keyword = undef;
my $limit = undef;
my $dirPath = undef;
my $filename = "res";
my $save = undef;
foreach $arg (@ARGV) {
  if ($arg =~ /^-s(.*)$/) {
    my $path = $1;
    ($dirPath) = $path =~ /(.*)\/[^\/]*$/;
    mkdir $dirPath if (length $dirPath);
    ($filename) = $path =~ /([^\/]+)$/;
    $save = "true";
  } elsif ($arg =~ /^-n(.*)$/) {
    $limit = $1;
  } else {
    $keyword = $arg;
  }
}

my @results = GoImgMod::getImgURL($keyword);
my $index = 0;
foreach $res (@results) {
  $index++;
  last if (defined $limit and $index > $limit);
  if (defined $save) {
    my ($suffix) = $res =~ /\.([^\.]*)$/;
    `wget -q -O$dirPath/$filename.$index.$suffix $res`;
  } else {
    print "$index.) $res\n" if defined($res);
  }
}
