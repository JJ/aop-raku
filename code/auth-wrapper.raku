#!/usr/bin/env perl6

sub doing-good() {
    return "good"
};

say doing-good();

&doing-good.wrap( {
    say callframe(-1).gist;
    callsame;
});

say doing-good();
