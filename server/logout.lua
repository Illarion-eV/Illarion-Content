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

	if theChar.name == "Alsaya" then
		npcDefaultPosition = position(122, 521, 0);
		npcNewPosition = position(122, 525, 0);
		npcCharObject = world:getCharacterOnField(npcNewPosition);
		npcCharObject:warp(npcDefaultPosition);
	end

end
