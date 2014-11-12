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

-- INSERT INTO longtimeeffects VALUES (550, 'satk_deathgaze', 'monster.lte.lte_deathgaze');

function M.addEffect (gazeEff,user)

end

function M.callEffect (gazeEff,user)
	found, effTime = gazeEff:findValue("effTime");
	if found and (effTime>0) then
		local HelmList = {7,16,94,184,185,2286,2287,2291,2302,2303,2444};
		local helmet = user:getItemAt (1);
		for j,k in pairs(HelmList) do
			if not k == helmet.id then
				user:increaseAttrib ("hitpoints",-300);
				gazeEff:addValue("effTime",effTime-1);
				if (math.random(100)<= 10) then
					user:inform ("The terrifying gaze of the monster is piercing your skull, making you feel like your head is about to explode.",Player.mediumPriority);
				end
			else
				return false;
			end
		end
	else 
		return false;
	end
	return true;
end

function M.loadEffect(gazeEff, user)

end

function M.removeEffect(gazeEff, user)

end

return M

