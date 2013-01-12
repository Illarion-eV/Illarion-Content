-- Schiffkaptain Blackbeard

-- Route: Hafen - Greenbriar

require("npc.base.ships");
require("npc.base.functions");
module("npc.blackbeard", package.seeall, package.seeall(npc.base.ships));

-- Insert Statements für nötige NPCs
-- INSERT INTO npc VALUES (1000,2,-401,-489,0,0,'f','Ship NPC',NULL,0);
-- INSERT INTO npc VALUES (1001,2,-401,-488,0,0,'f','Ship NPC',NULL,0);
-- INSERT INTO npc VALUES (1002,2,-401,-487,0,0,'f','Ship NPC',NULL,0);
-- INSERT INTO npc VALUES (1003,2,-402,-488,0,0,'f','Ship NPC',NULL,0);
-- INSERT INTO npc VALUES (1004,2,-402,-487,0,0,'f','Ship NPC',NULL,0);
-- INSERT INTO npc VALUES (1005,2,-403,-488,0,0,'f','Ship NPC',NULL,0);
-- INSERT INTO npc VALUES (1006,2,-403,-487,0,0,'f','Ship NPC',NULL,0);
-- INSERT INTO npc VALUES (1007,2,-404,-488,0,0,'f','Ship NPC',NULL,0);
-- INSERT INTO npc VALUES (1008,2,-404,-487,0,0,'f','Ship NPC',NULL,0);
-- INSERT INTO npc VALUES (1009,2,-405,-488,0,0,'f','Ship NPC',NULL,0);
-- INSERT INTO npc VALUES (1010,2,-405,-487,0,0,'f','Ship NPC',NULL,0);
-- INSERT INTO npc VALUES (1011,2,-406,-489,0,0,'f','Ship NPC',NULL,0);
-- INSERT INTO npc VALUES (1012,0,-281,53,0,0,'f','Capitain Blackbeard','npc_blackbeard.lua',0);

function useNPC( User )
    User:introduce(thisNPC);
    thisNPC:increaseSkill(1,"common language",100);
    thisNPC:talkLanguage( Character.say, Player.german, "Fass mich an und ich schneid dir die Augen raus, Landratte.");
    thisNPC:talkLanguage( Character.say, Player.english, "Touch me, and I will cut out your eyes, landlubber.");
end

function nextCycle()
    return;
end;

function dummy()
    if InitShips() then
        anchor = position(-290,53,0);
        route = {4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4, -- 49x Süden
                 6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6, -- 52x Westen
                 4,4,4,4,4,4,4,4,4,4,4,4,4, -- 13x Süden
                 6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6, -- 51x Westen
                 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 -- 19x Norden
                }
        oldcenterpos = position(anchor.x,anchor.y,anchor.z);
        step = 0;
        ListDir = 1;
        currentDir = nil;
        captain_wait_pos = position(-441,-486,0);
        captain_harbor_pos = { position(-281,53,0), position(-392,89,0) };
        passenger_landing = { position(-284,53,0), position(-394,88,0) };
        automatic_drive_away = 0;
        max_wait_time = 3000;
        zaehler = 0;
        ShipDrive = false;
		--[[ runtime error... no char on that field
        AddShipPosition({0,-3},world:getCharacterOnField(position(-401,-489,0)));
        AddShipPosition({1,-2},world:getCharacterOnField(position(-401,-488,0)));
        AddShipPosition({-1,-2},world:getCharacterOnField(position(-401,-487,0)));
        AddShipPosition({2,-1},world:getCharacterOnField(position(-402,-487,0)));
        AddShipPosition({-2,-1},world:getCharacterOnField(position(-402,-488,0)));
        AddShipPosition({2,0},world:getCharacterOnField(position(-403,-487,0)));
        AddShipPosition({-2,0},world:getCharacterOnField(position(-403,-488,0)));
        AddShipPosition({2,1},world:getCharacterOnField(position(-404,-487,0)));
        AddShipPosition({-2,1},world:getCharacterOnField(position(-404,-488,0)));
        AddShipPosition({1,2},world:getCharacterOnField(position(-405,-487,0)));
        AddShipPosition({-1,2},world:getCharacterOnField(position(-405,-488,0)));
        AddShipPosition({0,3},world:getCharacterOnField(position(-406,-489,0)));
		]]
        AddPassangerPosition({1,-1});
        AddPassangerPosition({-1,-1});
        AddPassangerPosition({1,0});
        AddPassangerPosition({-1,0});
        AddPassangerPosition({1,1});
        AddPassangerPosition({-1,1});
        AddPassangerPosition({0,-1});
        AddPassangerPosition({0,0});
        AddPassangerPosition({0,1});
        InitShipPos(route[1]);
        ---------------------------------- Schiffteil fertig -------------------------------------
        
        ---------------------------------- Sprachteil anfang -------------------------------------
        
        thisNPC:increaseSkill(1,"common language",100);
        --npc.base.functions.InitTalkLists()
        --npc.base.functions.AddTraderTrigger("[Gg]rü[ßs]+e","Aye. Was willst' Landratte?");  
        
        TradSpeakLang={0,1};
        TradStdLang=0;
        --common language=0
        --human language=1
        --dwarf language=2
        --elf language=3
        --lizard language=4
        --orc language=5
        --halfling language=6
        --fairy language=7
        --gnome language=8
        --goblin language=9
        --ancient language=10      
    end
    
    if ShipDrive then
        zaehler = zaehler + 1;
        if (zaehler == 7) then
            if ((ListDir == 1) and (step == table.getn(route))) then
                ShipDrive = false;
                thisNPC:warp(captain_harbor_pos[2]);
                WarpPassangersToo(passenger_landing[2]);
                ListDir=-1;
                ClearPassengers();
                step = step + 1;
            elseif ((ListDir == -1) and (step == 1)) then
                ShipDrive = false;
                thisNPC:warp(captain_harbor_pos[1]);
                WarpPassangersToo(passenger_landing[1]);
                ListDir=1;
                ClearPassengers();
                step = step - 1;
            else
                DoNextMove();
            end
            zaehler = 0;          
        end
    end          
end

function receiveText(texttype, message, originator)
    originator:introduce(thisNPC);
    AddPassanger(originator,message);
    Start(originator,message);
    Debug(message);
end
                
            
            
function AddPassanger(originator,message)
    if (string.find(message,"[Ss]chiff") ~= nil) then
        if not CheckForPassanger(originator.id) then
            if (GetPassanger(1) == nil) then
                thisNPC:talk(Character.say,"Aye. Du fährst mit und würdest zahlen. Noch wer?");
            else
                thisNPC:talk(Character.say,"Aye. Du fährst mit. Noch wer?");
            end
            TryAddPassanger(originator);            
        else
            thisNPC:talk(Character.say,"Du fährst doch schon mit! Arr. Verscheisser mich nich!");
        end
    elseif (string.find(message,"[Ii]ch") ~= nil) then
        if not CheckForPassanger(originator.id) then
            if (GetPassanger(1) ~= nil) then
                if TryAddPassanger(originator) then
                    thisNPC:talk(Character.say,"Aye. Du fährst mit. Noch wer?");
                else
                    thisNPC:talk(Character.say,"Das schiff is' voll.");
                end
            else
                thisNPC:talk(Character.say,"Was \""..User.lastSpokenText.."\"?");
            end
        else
            thisNPC:talk(Character.say,"Du fährst doch schon mit! Arr. Verscheisser mich nich!");
        end
    end
end

function Start(originator,message)
    if (string.find(message,"[Ll]os") ~= nil) then
        if (ListDir==1) then
            RotateTo(route[1]);
            originator:setQuestProgress(7,1);
        else
            RotateTo(route[table.getn(route)]);
            originator:setQuestProgress(7,2);
        end
        thisNPC:warp(captain_wait_pos);
        ShipDrive = true;
    end
end

function Debug(message)
    if (string.find(message,"rotate %d") ~= nil) then
        a,b,value = string.find(message,"(%d)");
        value = value +1 -1;
        RotateTo(value);
    elseif (string.find(message,"move %d") ~= nil) then
        a,b,value = string.find(message,"(%d)");
        value = value +1 -1;
        MoveShip(value);
    end
end
