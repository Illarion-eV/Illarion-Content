require("base.keys")
require("base.common")

module("server.logout", package.seeall())

function onLogout( theChar )
	  if false then
	  	  return true;
	  end

    -- begin loo
    local posi = theChar.pos;
    if (posi.x == -73 or posi.x == -72) and (posi.y == -68 or posi.y == -67) and posi.z == 0 then
        local bucket = world:getItemOnField( position( -72, -69, 0 ) );
        local door = world:getItemOnField( position( -74, -68, 0 ) );
        base.keys.UnlockDoor( door );
        door = world:getItemOnField( position( -74, -68, 0 ) );
        OpenDoor( door );
        bucket.id = 51;
        world:changeItem( bucket );
    end;
    -- end loo
    
	-- begin cow transporter
	local setQP = true;
	if (theChar:getQuestProgress(8) ~= 0) then -- Der hat eine Kuh
        found_cow = false;
        npcs = world:getNPCSInRangeOf(theChar.pos,7); -- Suchen wir mal alle npcs
        for i, npc in pairs(npcs) do
            find_transporter, effect_transporter = npc.effects:find(10); -- hat eine unsere Transporter Effekt?
            if find_transporter then -- Tatsache!
                find_owner,value_owner = effect_transporter:findValue("owner"); -- Wem sie gehört?
                if find_owner then
                    if (value_owner == theChar.id) then -- Unserem Char!
                        npcpos = npc.pos;
                        theChar:setQuestProgress(8,base.common.PositionToData( npcpos ));
                        world:deleteNPC( npc.id ); -- Dann weg mit der Kuh
                        for i=-1,1 do
                            for k=-1,1 do
                                checkpos = position( npcpos.x+i, npcpos.y+k, npcpos.z );
                                if world:isItemOnField( checkpos ) then
                                    checkitem = world:getItemOnField( checkpos );
                                    if ( ( checkitem.id == 321 ) and ( checkitem.quality == 111 ) and ( checkitem.data == theChar.id ) ) then
                                        world:erase( checkitem, 1 );
                                    end
                                end
                            end
                        end
                        setQP = false;
                    end
                end
            end
        end
    end
    if setQP then
		theChar:setQuestProgress(8,0);
	end
	-- end cow transporter
	
    -- begin newbie island
    if (theChar:getQuestProgress(2) == 320) then -- Der Char. ist ein Newb und befindet sich gerade auf der Newbieinsel am Kämpfen
		theChar:setQuestProgress(2,322);

    elseif (theChar:getQuestProgress(2) == 35) then -- Der Char. ist ein Newb und befindet sich gerade auf der Newbieinsel am Kämpfen
		theChar:setQuestProgress(2,36);
    end
	-- end newbie island
	
	-- begin tying
	local foundEffect, Tying = theChar.effects:find(24);
	if foundEffect then -- Char is a captive, save logout time
		Tying:addValue("logout",1);
		Tying:addValue("logyears",world:getTime("year"));
		Tying:addValue("logmonths",world:getTime("month"));
		Tying:addValue("logdays",world:getTime("day"));
		Tying:addValue("loghours",world:getTime("hour"));
		Tying:addValue("logminutes",world:getTime("minute")+3);
		Tying:addValue("logseconds",world:getTime("second"));
		foundCapturer, Capturer = Tying:findValue("Capturer");
		local logText = os.date()..": "..theChar.name.." has logged out."..(foundCapturer and " Capturer: "..Capturer or "")
		coldLog,errMsg=io.open("/home/nitram/logs/tying_log.txt","a");
	    if (coldLog~=nil) then
	        coldLog:write(logText.."\n");
	        coldLog:close();
		end
	end
	-- end tying
end
