#!/usr/bin/env perl6

sub doing-good() {
    return "good"
};

say doing-good();

&doing-good.wrap( sub {
    say "Called from {Backtrace.new[*-2].subname}";
    callsame;
});

say doing-good();

sub caller () {
    say doing-good();
}

sub outer( ) {
    caller;
}

outer();
