module("triggerfield.ma_secret_room", package.seeall)

function CharacterOnField(Character)

    if not (Character.pos == position(74,41,50)) then
        if not ( string.find( Character.lastSpokenText, "[Ss][Zz][Ee][Rr][Ss][Cc][Hh][Ee][Yy]" ) ~= nil ) then
            return
        end

        if (Character.activeLanguage ~= 10) then
            return
        end
    end
    local DoorPos = position(73,41,50);
    if (world:isItemOnField(DoorPos)) then
        local Item = world:getItemOnField(DoorPos);
        world:erase(Item,1);
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
