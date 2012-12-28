module("lte.blessedheal", package.seeall)

function addEffect( myEffect, Character )
    world:gfx( 16, Character.pos );   
    world:makeSound( 13, Character.pos );
    Character:increaseAttrib( "hitpoints", 500 * ( Character:increaseAttrib( "intelligence", 0 ) + math.random( -2, 2 ) ) );
    Character:talk( Character.say, "#me is encircled with revitalizing light emitted by the wielded sword." );
end;

function callEffect( myEffect, Character )
    item1 = Character:getItemAt( 5 );
    item2 = Character:getItemAt( 6 );
    if ( ( ( item1.id == 2701 ) and ( tonumber(item1:getData("healData")) == 100 ) ) or
         ( ( item2.id == 2701 ) and ( tonumber(item2:getData("healData")) == 100 ) ) ) then
        Character:inform( "Your sword seems to have regained the energy." );
    end;
    return false;
end;
