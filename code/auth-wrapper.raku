#!/usr/bin/env perl6

sub doing-good() { return "good" };
say doing-good();

&doing-good.wrap( sub {
    my $bt = Backtrace.new;
    my @subnames = $bt.grep: { .subname ~~ /^\w/ };
    return  "Called from 🔈{@subnames.map( *.subname ).join(" ⇒ ")}🔈 →" ~
            callsame;
});

say doing-good();
sub caller() { doing-good(); }
say caller;
sub outer() { caller; }
say outer();
