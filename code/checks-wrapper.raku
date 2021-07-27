#!/usr/bin/env perl6

sub doing-good() {
    return "good"
};

&doing-good.wrap( sub {
    return callsame unless Backtrace.new.grep: { .subname  ~~ /bad/ };
});

sub caller () {
    doing-good();
}

say "We're «{caller}»";

sub bad-guy() {
    caller;
}

say "And now «{bad-guy}»";
