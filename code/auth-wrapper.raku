#!/usr/bin/env perl6

sub doing-good() { return "good" };
say doing-good();

&doing-good.wrap( sub {
    my $bt = Backtrace.new;
    my $interesting-sub = $bt[$bt.next-interesting-index(:named)].subname;
    return  "Called from 🔈{$interesting-sub}🔈 →" ~ callsame;
});

say doing-good();
sub caller() { doing-good(); }
say caller;
sub outer() { caller; }
say outer();
