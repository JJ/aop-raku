#!/usr/bin/env perl6

sub doing-good() {  return "good"} ;

&doing-good.wrap( sub {
    if Backtrace.new.grep: { .subname  ~~ /bad/ } {
        fail("Not authorized to call this");
    } else {
        return callsame;
    }
});

sub caller () { doing-good(); }
say "We're «{caller}»";

sub bad-guy() { caller; }
say "And now «{bad-guy}»";
