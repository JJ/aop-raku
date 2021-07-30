#!/usr/bin/env perl6

proto sub show-value( | ) {}
multi sub show-value( @a-var ) {
    say "Value of {@a-var.^name} is ", @a-var.join(",");
}
multi sub show-value( $a-var ) {
    say "Value of {$a-var.^name} is ", $a-var.gist;
}

ENTER { say "Going in"; }
our @foo will enter { show-value(@_) } = 1, 2, 3;
our $bar will enter { show-value($_) } = "baz";

