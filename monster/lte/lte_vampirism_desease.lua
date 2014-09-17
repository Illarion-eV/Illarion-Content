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
module("monster.lte.vampirism_desease", package.seeall);

-- INSERT INTO longtimeeffects VALUES (501, 'satk_vampirism_desease', 'monster.lte.vampirism_desease');

function addEffect(VampEffect, User)
    return true;
end

function loadEffect(VampEffect, User)

end

function callEffect(VampEffect, User)
	
	local hourTime = world:getTime("hour");
	if (hourTime < 6) and (hourTime > 20) then
		return true;
	end
	
	if (User.pos.z < 0) then
		return true;
	end
	
	local foundProtection, Protection = VampEffect:findValue("protection");
	if foundProtection then
		Protection = Protection - 1;
		if(Protection > 0) then
			VampEffect:addValue("protection", Protection);
		else
			VampEffect:removeValue("protection");
		end
		return true;
	end
	
	local rand = math.random(1000);
	if (rand == 1) then
		common.InformNLS(User,
			"Du verspürst das Verlangen danach, jemanden zu töten...",
			"You feel like killing someone...");
	end
	
	local foundHealthPerCall, HealthPerCall = VampEffect:findValue("healthpercall");
	if not foundHealthPerCall then
		HealthPerCall = 50;
		VampEffect:addValue("healthpercall", HealthPerCall);
	end
	
	local HealthPoints = User:increaseAttrib("hitpoints", -HealthPerCall);	
	if(HealthPoints <= 0) then
		return false;
	end
	
    return true;
end

function removeEffect(VampEffect, User)

end
