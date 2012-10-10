require("base.keys")
require("base.common")

module("server.logout", package.seeall)

function onLogout( theChar )
	  if false then
	  	  return true;
	  end

    world:gfx(31,theChar.pos); --A nice GFX that announces clearly: A player logged out.

	-- begin newbie island
    if (theChar:getQuestProgress(2) == 320) then -- Der Char. ist ein Newb und befindet sich gerade auf der Newbieinsel am Kaempfen
		theChar:setQuestProgress(2,322);

    elseif (theChar:getQuestProgress(2) == 35) then -- Der Char. ist ein Newb und befindet sich gerade auf der Newbieinsel am Kaempfen
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

	if theChar.name == ("Valerio Guilianni" or "Rosaline Edwards" or "Elvaine Morgan") then
		exchangeFactionLeader( theChar.name )
	end

end

-- Function to exchange the faction leader of a town.
-- @factionLeaderName Name of the faction leader
-- @npcPositions Array of position {default position, new position}
function exchangeFactionLeader( factionLeaderName )
	if factionLeaderName == "Rosaline Edwards" then
		npcPositions = {position(122, 521, 0), position(237, 104, 0)};
	elseif factionLeaderName == "Valerio Guilianni" then
		npcPositions = {position(337, 215, 0), position(238, 104, 0)};
	else
		npcPositions = {position(898, 775, 2), position(239, 104, 0)};
	end
	if world:isCharacterOnField(npcPositions[2]) == true then
		npcCharObject = world:getCharacterOnField(npcPositions[2]);
		npcCharObject:forcewarp(npcPositions[1]);
	end
end
