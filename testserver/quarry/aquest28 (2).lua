module("lte.aquest28", package.seeall)
-- Long Time Effect Script: Long time effect for Quest #28
-- Effect ID: 32

function addEffect(aquest28Effect,Character)
	aquest28Effect.nextCalled=36000; --every rl hour
	today = world:getTime("day");
	aquest28Effect:addValue("lastday", today);
	--Character:inform("lade 	Aquest28Effekt ");
	--aquest28Effect.nextCalled=20; --every 2sec. hour
	--today = world:getTime("minute");
	--aquest28Effect:addValue("lastday", today);
	--Character:inform("Minute:"..today);
	return true;
end

function callEffect(aquest28Effect,Character)
 	aquest28Effect.nextCalled=36000; --every rl hour
    --Character:inform("im callEffect");
	--aquest28Effect.nextCalled=20; --every rl hour
 	found_lastday,lastday = aquest28Effect:findValue("lastday");
 	if found_lastday then
 	    if OneDayDelay(lastday,Character) then
 	        return false;
		end
		return true;
	end
    Character:inform("Error in LTE 32, please inform a DEV!");
    return false;
end

function removeEffect(aquest28Effect,Character)
	aquest28Effect:removeValue("lastday");
	--Character:inform("entferne Aquest28Effekt");
	return true;
end

function loadEffect(aquest28Effect,Character)
    --aquest28Effect.nextCalled=20; --ONLY FOR DEBUG PURPOSE!!!!!! remove complete after
	--Character:inform("lade 	Aquest28Effekt nach relog");
	--found_lastday,lastday = aquest28Effect:findValue("lastday");
 	--if found_lastday then
 	  --  if OneDayDelay(lastday,Character) then
        --  	aquest28Effect.nextCalled=20; --call in 1 sec.
		--end
 		--aquest28Effect.nextCalled=36000; --every rl hour
 		aquest28Effect.nextCalled=20; -- call in 2 seconds
		--end
	return true;
end
--checks if there is more than 1 day delay before Char. can do the cow quest again
function OneDayDelay(lastday,Character)
	local today = world:getTime("day");
--	Character:inform("today: "..today.." lastday: "..lastday);
	local diff = today - lastday; -- eg. 24 ... 2
	if diff < 0 then diff = 1; end
	
	
	if diff >0 then return true; else return false; end		
end
