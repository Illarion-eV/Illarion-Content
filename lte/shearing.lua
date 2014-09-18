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
-- Long Time Effect Script: Shearing sheep
-- Effect ID: 402


local common = require("base.common")
module("lte.shearing", package.seeall)

function addEffect(shearingEffect, Animal)

end

function callEffect(shearingEffect, Animal)

	local foundAmount, gatherAmount = shearingEffect:findValue("gatherAmount");
	if (not foundAmount) then
		return false;
	end
	if (gatherAmount <= 0) then
		return false;
	end
	
	if gatherAmount >= 20 then
		newAmount=0; --Restock wool
		shearingEffect:addValue("gatherAmount", newAmount);
		world:makeSound(2, Animal.pos); --Baah!
	end
	
	shearingEffect.nextCalled = 7200; -- call every 12 minutes
	
	return true;
	
end
