function CloseSecretWall()
    local DoorPos = position(73,41,50);
    if (world:isItemOnField(DoorPos)) then
        local Item = world:getItemOnField(DoorPos);
        if (Item.id == 342) then
            return
        end
    end
    
    CharsInRange = world:getPlayersInRangeOf(DoorPos,5)
    if (table.getn(CharsInRange) == 0) then
        world:createItemFromId(342,1,DoorPos,true,1,0);
        CharsInRange = world:getPlayersInRangeOf(DoorPos,15);
        for i, Chara in pairs(CharsInRange) do
            if (Chara:getPlayerLanguage() == 0) then
                Chara:inform("Du hörst das Geräusch von sich verschiebendem Stein");
            else
                Chara:inform("You hear the sound of moving stone");
            end
        end
    end
end