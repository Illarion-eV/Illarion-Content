--Name:        Transportkuh
--Race:        Esel
--Town:        Wo immer eine Kuh gebraucht wird
--Function:    Transporter
--Position:    Dynamisch
--Facing:      South
--Last Update: 05/26/2007
--Update by:   Nitram

module("npc.lasttier", package.seeall)

function useNPC(User)
    if lost[thisNPC.id] then -- Kuh wurde zurück gelassen
        find_transporter, effect_transporter = thisNPC.effects:find(10);
        if not find_transporter then
            return
        end
        find_owner,value_owner = effect_transporter:findValue("owner");
        if not find_owner then
            return
        end
        if ( value_owner == 0 ) then
            find_owner,value_owner = effect_transporter:findValue("old_owner");
            if not find_owner then
                return
            end
        end
        User:moveDepotContentFrom( value_owner, User.id, value_owner );
        effect_transporter:addValue("owner", User.id );
    end
end

function InitNPC()
    if not InitDone then
        InitDone = true;
        
        FollowInRange = 7; -- Maximaler Abstand zum Besitzer in dem das Lasttier folgt
        CyclesBetweenSteps = 6; -- Wieviele 1/10s zwischen 2 Schritten
        ActiveCyclesWithoutTarget = 880; -- Aktive Schritte ohne Ziel bis zum löschen
        
        lost = {};
        moving = {};
        depotpos = {};
        cnt = {};
        lostcnt = {};
        blocked = {};
        singleNPCInit = {};
        
        itemlist = { 10, 86, 87,317,484,485,596,597,598,599,712,713,714,715,923,924,927,928};
    
    end
    
    if not singleNPCInit[thisNPC.id] then
        thisNPC:increaseSkill(1,"common language",100);
        singleNPCInit[thisNPC.id] = true;
        moving[thisNPC.id] = true;
        lost[thisNPC.id] = false;
        cnt[thisNPC.id] = 0;
        lostcnt[thisNPC.id] = 0;
        blocked[thisNPC.id] = false;
    end
end      

function receiveText(Texttype, Message, Originator)
    if (Originator:getQuestProgress(8) == 0) then
        return
    end
    InitNPC();
    find_transporter, effect_transporter = thisNPC.effects:find(10);
    if not find_transporter then
        return
    end
    find_owner,value_owner = effect_transporter:findValue("owner");
    if not find_owner then
        return
    end
    if (Originator.id == value_owner) then
        if (thisNPC:isInRange(Originator,FollowInRange)) then
            if (string.find(Message,"[Kk]omm.+mit")~=nil)
            or (string.find(Message,"[Ww]eiter")~=nil)
            or (string.find(Message,"[Ff]ollow.+me")~=nil) then
                if depotpos[thisNPC.id] then
                    if not moving[thisNPC.id] then
                        if world:isItemOnField(depotpos[thisNPC.id]) then
                            depot = world:getItemOnField(depotpos[thisNPC.id]);
                            if (depot.id == 321) then
                                world:erase(depot,1);
                                depotpos[thisNPC.id] = nil;
                            end
                        end
                    end
                end
                moving[thisNPC.id] = true;
            elseif (string.find(Message,"[Bb]leib.+stehen")~=nil)
            or (string.find(Message,"[Ss]tay")~=nil)
            or (string.find(Message,"[Ss]top")~=nil) then
                if moving[thisNPC.id] then
                    depotpos[thisNPC.id] = genDepotPos( );
                    if not world:isCharacterOnField( depotpos[thisNPC.id] ) and not world:isItemOnField( depotpos[thisNPC.id] ) then
                        world:createItemFromId(321,1,depotpos[thisNPC.id],true,1111,Originator.id);
                        depot = world:getItemOnField(depotpos[thisNPC.id]);
                        if (depot.id == 321) then
                            depot.wear = 2;
                            world:changeItem(depot);
                        else
                            depotpos[thisNPC.id] = nil;
                        end
                    else
                        depotpos[thisNPC.id] = nil;
                    end
                end
                moving[thisNPC.id] = false;
			elseif (string.find(Message,"[Bb]eweg")~=nil)
			or (string.find(Message,"[Mm]ove")~=nil) then
				if depotpos[thisNPC.id] then
                    if not moving[thisNPC.id] then
                        if world:isItemOnField(depotpos[thisNPC.id]) then
                            depot = world:getItemOnField(depotpos[thisNPC.id]);
                            if (depot.id == 321) then
                                world:erase(depot,1);
                                depotpos[thisNPC.id] = nil;
                            end
                        end
                    end
                end
                moving[thisNPC.id] = true;
				if thisNPC:isInRange(Originator,1) then
					thisNPC:move(Originator:getFaceTo(),true);
				else
					thisNPC:talk(Character.say, "IIAA");
				end
            end
        end
    end
end

function genDepotPos( )
    npc_look_at = thisNPC:getFaceTo();
    if (npc_look_at == 0) then
        return position(thisNPC.pos.x + 1,thisNPC.pos.y,thisNPC.pos.z);
    elseif (npc_look_at == 2) then
        return position(thisNPC.pos.x,thisNPC.pos.y + 1,thisNPC.pos.z);
    elseif (npc_look_at == 4) then
        return position(thisNPC.pos.x - 1,thisNPC.pos.y,thisNPC.pos.z);
    elseif (npc_look_at == 6) then
        return position(thisNPC.pos.x,thisNPC.pos.y - 1,thisNPC.pos.z);
    end
    return position(1,0,0);
end


function nextCycle()
    InitNPC();
    cnt[thisNPC.id] = cnt[thisNPC.id] + 1;
    if (cnt[thisNPC.id] == ( CyclesBetweenSteps + GetTileMod( ) ) ) then
        cnt[thisNPC.id] = 0;
    else
        return
    end
    if depotpos[thisNPC.id] then
        depot = world:getItemOnField(depotpos[thisNPC.id]);
        if (depot.id == 321) then
            depot.wear = 2;
            world:changeItem(depot);
        else
            depotpos[thisNPC.id] = nil;
        end
    end
    find_transporter, effect_transporter = thisNPC.effects:find(10);
    if not find_transporter then
        return
    end
    find_owner,value_owner = effect_transporter:findValue("owner");
    if not find_owner then
        return
    end
    char_owner = false;
    if (value_owner ~= 0) then        
        players = world:getPlayersInRangeOf(thisNPC.pos,FollowInRange);
        if (table.getn(players)>0) then
            for i, player in pairs(players) do
                if (player.id == value_owner) then
                    if (player:increaseAttrib("hitpoints",0) > 0) then
                        if (player:getQuestProgress(8) == 0) then
                            player:setQuestProgress(8,1);
                        end
                        lost[thisNPC.id] = false;
                        char_owner = player;
                    else
                        lost[thisNPC.id] = false;
                        effect_transporter:addValue("owner",0);
                        effect_transporter:addValue("old_owner",value_owner);
                        player:setQuestProgress(8,0);
                    end
                    break;
                end
            end
        end

        if not char_owner then
            if ( ( thisNPC.pos.x > -289 ) and ( thisNPC.pos.x < -279 ) and ( thisNPC.pos.y > 46 ) and ( thisNPC.pos.y < 56 ) and ( thisNPC.pos.z == 0 ) ) then
                players = world:getPlayersInRangeOf( position( 302, 229, 0 ), 12);
                if (table.getn(players)>0) then
                    for i, player in pairs(players) do
                        if (player.id == value_owner) then
                            if (player:increaseAttrib("hitpoints",0) > 0) then
                                if (player:getQuestProgress(8) == 0) then
                                    player:setQuestProgress(8,1);
                                end
                                lost[thisNPC.id] = false;
                                thisNPC:warp( position( 302, 229, 0 ) );
                                return true;
                            else
                                lost[thisNPC.id] = false;
                                effect_transporter:addValue("owner",0);
                                effect_transporter:addValue("old_owner",value_owner);
                                player:setQuestProgress(8,0);
                            end
                            break;
                        end
                    end
                end
            elseif ( ( thisNPC.pos.x > 296 ) and ( thisNPC.pos.x < 305 ) and ( thisNPC.pos.y > 223 ) and ( thisNPC.pos.y < 298 ) and ( thisNPC.pos.z == 0 ) ) then
                players = world:getPlayersInRangeOf( position( -285, 49, 0 ), 12);
                if (table.getn(players)>0) then
                    for i, player in pairs(players) do
                        if (player.id == value_owner) then
                            if (player:increaseAttrib("hitpoints",0) > 0) then
                                if (player:getQuestProgress(8) == 0) then
                                    player:setQuestProgress(8,1);
                                end
                                lost[thisNPC.id] = false;
                                thisNPC:warp( position( -285, 49, 0 ) );
                                return true;
                            else
                                lost[thisNPC.id] = false;
                                effect_transporter:addValue("owner",0);
                                effect_transporter:addValue("old_owner",value_owner);
                                player:setQuestProgress(8,0);
                            end
                            break;
                        end
                    end
                end
            end
        end
    end
    if not char_owner then
        if not lost[thisNPC.id] then
            thisNPC:talk( Character.say, "IIIAAAAAAAA" );
            lostcnt[thisNPC.id] = 0;
            if ( depotpos[thisNPC.id] ) then
                depot = world:getItemOnField(depotpos[thisNPC.id]);
                world:erase( depot, 1 );
                depotpos[thisNPC.id] = nil;
            end
        end
        lostcnt[thisNPC.id] = lostcnt[thisNPC.id] + 1;
        if (lostcnt[thisNPC.id] == ActiveCyclesWithoutTarget + 1) then
            Charakters = world:getPlayersOnline();
            for i, Char in pairs(Charakters) do
                if (Char.id == value_owner) then
                    Char:setQuestProgress(8,0);
                end
            end
            world:deleteNPC( thisNPC.id );
            return
        end
        lost[thisNPC.id] = true;
        return
    end
    if moving[thisNPC.id] and not lost[thisNPC.id] then  
        XOff = thisNPC.pos.x - char_owner.pos.x;
        YOff = thisNPC.pos.y - char_owner.pos.y;
        if (math.sqrt(XOff*XOff + YOff*YOff) > 2) then
            if ((math.abs(XOff) < math.abs(YOff)) and not blocked[thisNPC.id]) or ((math.abs(XOff) > math.abs(YOff)) and blocked[thisNPC.id]) then
                if not MoveX(XOff,false) then
                    if not MoveY(YOff,false) then
                        MoveX(XOff,true);
                        blocked[thisNPC.id] = true;
                    else
                        blocked[thisNPC.id] = false;
                    end
                else
                    blocked[thisNPC.id] = false;
                end
            else
                if not MoveY(YOff,false) then
                    if not MoveX(XOff,false) then
                        MoveY(YOff,true);
                        blocked[thisNPC.id] = true;
                    else
                        blocked[thisNPC.id] = false;
                    end
                else
                    blocked[thisNPC.id] = false;
                end
            end
        end
    end
end

function MoveX(XOff,forced)
    if (XOff == 0) and not forced then
        return false;
    end
    
    if (XOff >= 0) then
        checkPos = position( thisNPC.pos.x - 1, thisNPC.pos.y, thisNPC.pos.z );
    else
        checkPos = position( thisNPC.pos.x + 1, thisNPC.pos.y, thisNPC.pos.z );
    end
    
    if not CheckItem( checkPos ) then
        return false;
    end
    
    old_pos = thisNPC.pos;
    if (XOff > 0) then
        thisNPC:move(6,true);
    else
        thisNPC:move(2,true);
    end
    if (old_pos == thisNPC.pos) then
        if forced and (XOff == 0) then
            thisNPC:move(6,true);
            if not (old_pos == thisNPC.pos) then
                return true;
            end
        end
        return false;
    else
        return true;
    end
end

function MoveY(YOff,forced)
    if (YOff == 0) and not forced then
        return false;
    end
    
    if (YOff >= 0) then
        checkPos = position( thisNPC.pos.x, thisNPC.pos.y - 1, thisNPC.pos.z );
    else
        checkPos = position( thisNPC.pos.x, thisNPC.pos.y + 1, thisNPC.pos.z );
    end
    
    if not CheckItem( checkPos ) then
        return false;
    end
    
    old_pos = thisNPC.pos;
    if (YOff > 0) then
        thisNPC:move(0,true);
    else
        thisNPC:move(4,true);
    end
    if (old_pos == thisNPC.pos) then
        if forced and (YOff == 0) then
            thisNPC:move(0,true);
            if not (old_pos == thisNPC.pos) then
                return true;
            end
        end
        return false;
    else
        return true;
    end
end

function CheckItem( posi )
    local fld = world:getField(posi);
    local cnt = fld:countItems();
    local i;
    for i=0,cnt-1 do
        if isPassable( (fld:getStackItem(i)).id, 1, table.getn( itemlist ) ) then
            return false;
        end;
    end;
    return true;
end

function isPassable( id , lower, upper )
    if lower > upper then
        return false;
    end;
    margin = math.floor((lower+upper)/2);
    if itemlist[margin] == id then
        return true;
    elseif itemlist[margin] < id then
        return isPassable( id, margin+1, upper );
    else
        return isPassable( id, lower, margin-1 );
    end;
end

function GetTileMod( )

    local Field = world:getField( thisNPC.pos )
    local TileID = Field:tile();
    
    if ( TileID == 4 ) then return 2 -- Acker
    elseif ( TileID == 6 ) then return 3 -- Wasser
    elseif ( TileID == 9 ) then return 4 -- Wald
    elseif ( TileID == 3 ) then return 3 -- Sand
    elseif ( TileID == 11 ) then return 1 -- Wiese
    elseif ( TileID == 2 or TileID == 15 ) then return 3 -- Fels
    elseif ( TileID == 8 ) then return 2 -- Dreck
    end
    return 0
end
