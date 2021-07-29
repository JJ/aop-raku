#!/usr/bin/env perl6

our &doing-good will enter {
    say( "running" );
        if Backtrace.new.grep: { .subname  ~~ /bad/ } {
            fail("Not authorized to call this");
        }
};

#sub caller () { &doing-good = {"good"}; doing-good()}
#say "We're «{caller}»";

#sub bad-guy() { &doing-good = {"bad"}; doing-good() }
#say "And now «{bad-guy}»";
