#!/usr/bin/env perl
use strict;
use warnings FATAL => 'all';
use Email::Stuffer;
use Devel::Dwarn;
my $usage = "$0 <TO> <EMAIL_BODY> <FILENAME>";
die "$usage\n" unless @ARGV == 3;
my $host = `hostname`;
chomp $host;
my $from =  "$ENV{USER}\@$host";
my $res = Email::Stuffer->from($from)->to($ARGV[0])->text_body($ARGV[1])
    ->attach_file($ARGV[2])->send;
Dwarn $res;
