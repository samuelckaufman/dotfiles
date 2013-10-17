#!/usr/bin/env perl
use strict;
use warnings FATAL => 'all';
use Module::Runtime qw[ use_module ];
my @noversions;
for (<>) {
    chomp;
    my $class = $_;
    use_module($class) or die "$@ $!";
    my $v = UNIVERSAL::VERSION($class);
    push( @noversions, $class ) and next unless $v;
    print "$class = $v\n";
}
for (@noversions) {
    warn "no version for $_\n";
}
