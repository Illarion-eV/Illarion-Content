--[[
Illarion Server

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, either version 3 of the License, or (at your option) any
later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.  See the GNU Affero General Public License for more
details.

You should have received a copy of the GNU Affero General Public License along
with this program.  If not, see <http://www.gnu.org/licenses/>. 
]]
local common = require("base.common")
local M = {}

---------------------------
-------- Character lernt eine Rune
---------------------------------
function M.addEffect(teachEffect, Character)
    Character:inform("AddEffect ausgeführt");

    
    year=world:getTime("year");
    year=(year-1)*31536000;					-- (year-1)*((15*24) + 5)*24*60*60;
    month=world:getTime("month");
    month=(month-1)*2073600;					-- (month-1)*24*24*60*60;
    day=world:getTime("day");
    day=(day-1)*86400;							-- (day-1)*24*60*60;
    hour=world:getTime("hour");
    hour=hour*3600;								-- hour*60*60;
    minute=world:getTime("minute");
    minute=minute*60;
    second=world:getTime("second");
    second=second;
            
    waittime=1814400;
	 
	timestamp=year+month+day+hour+minute+second+waittime;

	
 	teachEffect:addValue("Rune1Index",timestamp);
	teachEffect:addValue("Rune2Index",1);
	--Character:inform("moep->AddEffect erfolgreich");
	

end

-----------------------------------------------
------ Character is affected 
-----------------------------------------------
function M.callEffect(teachEffect, Character)    -- Effect wird ausgeführt


   	teachEffect.nextCalled =99999999999999;       -- call it again in öhm...never!


    return true;
end




----------------------------------------------
---- Character lost effect
----------------------------------------------

function M.removeEffect( Effect, Character )
  	-- Character:inform("moep->Und weiter gehts!");
end


function M.loadEffect(Effect, Character)

end

return M

