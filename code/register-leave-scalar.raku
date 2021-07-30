#!/usr/bin/env perl6

sub show-value( $a-var ) {
    say "Value of {$a-var.^name} is ", $a-var.gist;
}

sub do-stuff () {
    ENTER { say "Going in"; }
    our $bar will enter { show-value($_) };
    $bar = "baz";
    LEAVE { say "Leaving"; }
}
our $h will leave { say "\$h"; dd $_ } = 33;
do-stuff();
