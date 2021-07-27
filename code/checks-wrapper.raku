#!/usr/bin/env perl6

sub doing-good() {
    return "good"
};

say doing-good();

&doing-good.wrap( sub {
    callsame unless Backtrace.new[*-2].subname ~~ /bad/;
});

sub caller () {
    say doing-good();
}

say caller;

sub bad-guy( ) {
    caller;
}

say "And now «{bad-guy}»";
