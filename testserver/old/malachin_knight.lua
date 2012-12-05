-- INSERT INTO npc VALUES (nextval('npc_seq'),25, 30, -37, -6,4,false,'Ethereal Presence','npc_malachin_knight.lua',0);
-- INSERT INTO npc VALUES (116,25, 30, -37, -6,4,false,'Ethereal Presence','npc_malachin_knight.lua',0);

module("npc.malachin_knight", package.seeall)

function receiveText( texttype, message, originator )  
    thicCounter = 0;
    currentOriginator = originator;
    
    if state == nil then
        state = {};
        thisNPC:increaseSkill(1,"common language",100);
    end;
    
    -- in range
    if not thisNPC:isInRange(originator,4) then
        return;
    end;
    
    armor = originator:getItemAt( 3 );
    -- if no armor equipped
    if armor == nil then
        return false;
    end;

    -- if armor equipped is not salkamaerian
    if ( armor.id ~= 2389 ) and ( armor.data ~= 0 ) then
        return false;
    end;
    
    if ( string.find( message, "debug" ) ) then
        state[originator.id] = nil;
        originator:inform( "state 0" );
    end;
    
    if ( string.find( message, "debb" ) ) then
        state[originator.id] = 4;
        originator:inform( "state 4" );
    end;
    
    if ( string.find( message, "call for your presence" ) ~= nil ) and
         ( string.find( message, "as a knight" ) ~= nil ) and
           ( string.find( message, "as your disciple" ) ~= nil ) and
             ( state[originator.id] == nil ) then
       thisCounter = 1;
       originator:introduce( thisNPC );
    end;   
    
    if ( string.find( message, "with my armor" ) ~= nil ) and
         ( string.find( message, "my loyalty to the knighthood" ) ~= nil ) and
           ( string.find( message, "my loyalty to you" ) ~= nil ) and
             ( state[originator.id] == 1 ) then
       thisCounter = 41;
    end;   
    
    if ( string.find( message, "pray you to watch over me and my path" ) ~= nil ) and
         ( string.find( message, "protect me" ) ~= nil ) and
           ( string.find( message, "help me protect others" ) ~= nil ) and
             ( state[originator.id] == 2 ) then
       thisCounter = 81;
    end;
    
    if ( string.find( message, "[Bb]less this armor" ) ~= nil ) and
         ( string.find( message, "fight for the right and the just" ) ~= nil ) and
             ( state[originator.id] == 3 ) then
       thisCounter = 121;
    end;
    
    if ( state[originator.id] == 4 ) and 
         ( ( string.find( message, "yes" ) ~=  nil ) or
           ( string.find( message, "I do" ) ~= nil ) ) then
       thisCounter = 161;
    end; 
end;

function nextCycle()
    -- kill monsters if anyone is near
    if not thisCounter then
        thisCounter = 0;
    end;
    if ( thisCounter > 0 ) then
        monList = world:getMonstersInRangeOf( currentOriginator.pos, 2 );
        if monList ~= nil then
            for i = 0, ( table.getn( monList ) - 1 ) do
                world:gfx( 45, monList[i].pos );
                world:makeSound( 5, monList[i].pos );
                monList[i]:increaseAttrib( "hitpoints", - monList[i]:increaseAttrib( "hitpoints", 0 ) );
            end;
        end;
    end;
    
    if ( thisCounter > 0 ) and ( thisCounter <= 39 ) then
       if ( thisCounter == 39 ) then
         currentOriginator:inform( "You see a faint column of light appearing on the waters." );
         world:gfx( 37, thisNPC.pos );
         state[currentOriginator.id] = 1;
       end;
       thisCounter = thisCounter + 1;
    elseif ( thisCounter > 40 ) and ( thisCounter <= 79 ) then
        if ( thisCounter == 79 ) then
          currentOriginator:inform( "The light slowly forms the shape of a humanoid figure." );
          world:gfx( 37, thisNPC.pos );
          state[currentOriginator.id] = 2;
        end;
        thisCounter = thisCounter + 1;
    elseif ( thisCounter > 80 ) and ( thisCounter <= 119 ) then
        if ( thisCounter == 119 ) then
          currentOriginator:inform( "You can roughly distinguish the figure to be a gray haired armored knight." );
          world:gfx( 37, thisNPC.pos );
          state[currentOriginator.id] = 3;
        end;
        thisCounter = thisCounter + 1;
    elseif ( thisCounter > 120 ) and ( thisCounter <= 159 ) then
        if ( thisCounter == 159 ) then
          thisNPC:talk( Character.say, "#me drifts forward and places his ethereal hand on " .. currentOriginator.name ..
            "'s shoulder, \"Do you hold your words to be true and faithful?\"" );
          world:gfx( 37, position( currentOriginator.pos.x, currentOriginator.pos.y - 1, currentOriginator.pos.z ) );
          state[currentOriginator.id] = 4;
        end;
        thisCounter = thisCounter + 1;
    elseif ( thisCounter > 160 ) and ( thisCounter <= 199 ) then
        if ( thisCounter == 199 ) then
            thisCounter = 0;
            thisNPC:talk( Character.say, "#me slowly fades away and disappears while whispering, \"Then you have my blessings, " ..
            " and your armor shall protect you in the dark times of battle. Your prayer has been heard.\"" );
            world:gfx( 31, currentOriginator.pos );
            -- improve quality of armor
            local Quali = math.floor( armor.quality / 100 );
            local Durab = armor.quality - ( Quali * 100 );
            if ( Quali < 9 ) then
                Quali = Quali + 1;
            end;
            if ( Durab <= 84 ) then
                Durab = Durab + 15;
            else
                Durab = 99;
            end;
            armor.data = 16;
            armor.quality = ( Quali * 100 ) + Durab;
            world:changeItem( armor );
            state[currentOriginator.id] = 5;
            return;
        end;
        thisCounter = thisCounter + 1;
    end;
end;
