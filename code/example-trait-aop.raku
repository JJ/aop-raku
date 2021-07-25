#!/usr/bin/env raku

say 'start';
multi sub trait_mod:<is>(Sub $s, :$foo){
    say "⟨is foo⟩ has been called with ⟨$foo⟩ on {$s.name}";
}
sub bar() is foo<oi‽> {
    say 'bar has been called'
}
bar();
say "And now ...";
bar();