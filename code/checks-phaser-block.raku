#!/usr/bin/env perl6

my &doing-good will enter {
    .add_phaser: "ENTER",
            {
                    if Backtrace.new.grep: { .subname  ~~ /bad/ } {
                            fail("Not authorized to call this");
                    }
            }
} := -> { "good" };

sub caller () { &doing-good = {"good"}; doing-good()}
say "We're «{caller}»";

sub bad-guy() { &doing-good = {"bad"}; doing-good() }
say "And now «{bad-guy}»";
