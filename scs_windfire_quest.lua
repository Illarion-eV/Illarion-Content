function SoundEffects()
    local players = world:getPlayersInRangeOf(position(-240,-86,0),15); -- Suche nach Spielern
    if (table.getn(players)>0) then -- Spieler gefunden
        world:makeSound(27,position(-242,-88,0)); -- Wind Effect
        world:makeSound(27,position(-240,-88,0)); -- Wind Effect
        world:makeSound(27,position(-238,-88,0)); -- Wind Effect
        world:makeSound(27,position(-242,-86,0)); -- Wind Effect
        world:makeSound(27,position(-238,-86,0)); -- Wind Effect
        world:makeSound(27,position(-242,-84,0)); -- Wind Effect
        world:makeSound(27,position(-240,-84,0)); -- Wind Effect
        world:makeSound(27,position(-238,-84,0)); -- Wind Effect
    end

    players = world:getPlayersInRangeOf(position(-99,146,0),15); -- Suche nach Spielern
    if (table.getn(players)>0) then -- Spieler gefunden
        world:makeSound( 7,position( -97,148,0)); -- Fire Effect
        world:makeSound( 7,position( -99,148,0)); -- Fire Effect
        world:makeSound( 7,position(-101,148,0)); -- Fire Effect
        world:makeSound( 7,position( -97,146,0)); -- Fire Effect
        world:makeSound( 7,position(-101,146,0)); -- Fire Effect
        world:makeSound( 7,position( -97,144,0)); -- Fire Effect
        world:makeSound( 7,position( -99,144,0)); -- Fire Effect
        world:makeSound( 7,position(-101,144,0)); -- Fire Effect
    end
end