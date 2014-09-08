#!/usr/bin/env perl
use strict;
use warnings FATAL => 'all';
use Email::Stuffer;
use Devel::Dwarn;
my $host = `hostname`;
chomp $host;
my $from =  "$ENV{USER}\@$host";
my $res = Email::Stuffer->from($from)->to($ARGV[0])->text_body($ARGV[1])
    ->attach_file($ARGV[2])->send;
Dwarn $res;
