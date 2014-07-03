#!/usr/bin/env perl
use strict;
use warnings FATAL => 'all';
use Cpanel::JSON::XS;
my $json = Cpanel::JSON::XS->new;
$json->utf8(0);
$json->pretty(1);
use Data::Printer;
binmode(STDOUT,':encoding(UTF-8)');
my $usage = "$0 JSON_FILE\n";

my $f = $ARGV[0] || die $usage;
sub pause {
    my $derp = <STDIN>;
}

open( my $fh, "<:encoding(UTF-8)", $f ) or die "$@ $!";

while(<$fh>) {
    chomp;
    my $str = $_;
    for my $obj ($json->incr_parse($_)) {
        p($obj);
        pause;
    }
}
