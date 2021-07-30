#!/usr/bin/env raku

my %SUB-COUNTS;

multi sub trait_mod:<is>(Sub $s where .name().contains("-counted"), :$AOP!) {
    $s.wrap({
        say "Counting { $s.name }";
        %SUB-COUNTS{$s.name}++;
        callsame;
    });
}

multi sub trait_mod:<is>(Sub $s where .name().contains("-logged"), :$AOP!) {
    $s.wrap({
        say "Entering { $s.name }";
        callsame;
    });
}

sub water-logged() is AOP { return "Water"; }

sub out-logged() is AOP { return "Out"; }

sub we're-counted() is AOP {
    state $count = 0;
    return $count++;
}

sub we're-also-counted() is AOP { "Well" }

say water-logged(), " ", out-logged(), " ", water-logged();

say we're-counted() for ^20;
say we're-also-counted() for ^10;

say %SUB-COUNTS;
