-- called after every !fr command
-- note that !fr is a !rd with additional npc and spawn reloading
-- note further that reload_defs will be called before this if and only if the included !rd was successful

module("server.reload_tables", package.seeall)

function onReload()
    -- Abhandlung Schifffahrer
    Charakters = world:getPlayersOnline();
    for i, Char in pairs(Charakters) do
        ShipStatus = Char:getQuestProgress(7);
        if (ShipStatus==1) then -- Auf der Fahrt nach Greenbriar
            Char:warp(position(-394,88,0));
        elseif (ShipStatus==2) then -- Auf der Fahrt zum Hafen
            Char:warp(position(-284,53,0));
        end
        -- Abhandlung von Transporttieren
        if (Char:getQuestProgress(8) ~= 0) then
            PosOfCow = createCow( Char );
            if not PosOfCow then
                Char:inform("Fehler beim erstellen des Lasttieres");
            else
                Transporter = world:getCharacterOnField(PosOfCow);
                transport_effect = LongTimeEffect( 10, 500000 );
                transport_effect:addValue("owner",Char.id);
                Transporter.effects:addEffect(transport_effect);
            end
        end
        -- Abhandlung von Transporttieren fertig
    end

    return true;
end

function createCow( Char )
    for XPos=-3,3 do
        for YPos=-3,3 do
            if ( ( math.abs(XPos) + math.abs(YPos) ) < 6 ) then
                SettingPos = position(Char.pos.x+XPos,Char.pos.y+YPos,Char.pos.z);
                if not world:isCharacterOnField( SettingPos ) and not world:isItemOnField( SettingPos ) then
                    if world:createDynamicNPC("Lasttier",50,SettingPos,0,"npc_lasttier.lua") then
                        return SettingPos;
                    else
                        return false;
                    end
                end
            end
        end
    end
    return false;
end
