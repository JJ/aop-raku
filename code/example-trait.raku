#!/usr/bin/env raku

multi sub trait_mod:<is>(Sub $s where .name().contains("-logged"), :$AOP){
    say "⟨is AOP⟩ has been called on {$s.name}";
}
sub water-logged () is AOP {
    return 'water'
}

say water-logged();

