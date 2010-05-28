-- Skript f&uuml;r das Schlachten eines Schafes
function onDeath(monster)

        pos = monster.pos;
        --world:createMonster(1,pos,10);
        world:createItemFromId(173,1,pos,true,333,0)
end

