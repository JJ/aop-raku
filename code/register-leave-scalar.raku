#!/usr/bin/env perl6

sub show-value( $a-var ) {
    say "Value of {$a-var.^name} is ", $a-var.gist;
}

sub do-stuff () {
    ENTER { say "Going in"; }
    our $bar will leave { show-value($_) };
    $bar = "baz";
    LEAVE { say "Leaving"; }
}
do-stuff();
