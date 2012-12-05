module("triggerfield.shrine_eldan_enter", package.seeall)

-- Eldan Shrine entrance
function CharacterOnField(Character)
    if( string.find( Character.lastSpokenText, "[Oo]pfer" ) ~= nil ) then
        HItem = Character:getItemAt( Character.right_tool );
        if( HItem.id ~= 166 ) then    -- 166 == Wine
            HItem = Character:getItemAt( Character.left_tool );
        end
        if( HItem.id == 166 ) then    -- 166 == Wine
            if( (Character:getMagicFlags(0) == 0) and (Character:getMagicFlags(2) == 0) and (Character:getMagicFlags(3) == 0) ) then
                world:erase( HItem, 1 );
                -- Character:inform("Warp zum Hauptaltar Eldan's...");
                Character:startMusic(5);
                Character:warp( position( -184, -95, 46 ) );
            end
        end        
    end
end
