#!/usr/bin/env perl6

sub doing-good() {
    ENTER {
        if Backtrace.new.grep: { .subname  ~~ /bad/ } {
            fail("Not authorized to call this");
        }
    }
    return "good"
} ;

sub caller () { doing-good(); }
say "We're «{caller}»";

sub bad-guy() { caller; }
say "And now «{bad-guy}»";
