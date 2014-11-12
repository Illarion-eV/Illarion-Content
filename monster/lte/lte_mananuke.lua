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

-- INSERT INTO longtimeeffects VALUES (500, 'satk_mananuke', 'monster.lte.mananuke');

function M.addEffect(manaNuke, User)
	local magicResistance = User:getSkill(Character.magicResistance);
	local essence = User:increaseAttrib("essence", 0);
	
	local resistance = math.ceil(magicResistance / 10) + math.ceil(essence / 10);
	
	local steal = 20 - resistance;
	manaNuke:addValue("manaPerCall", steal);
	
    return true;
end

function M.loadEffect(manaNuke, User)

end

function M.callEffect(manaNuke, User)
	local foundManaPerCall, ManaPerCall = manaNuke:findValue("manaPerCall");
	if not foundManaPerCall then
		return false;
	end
	
	local foundManaStolen, ManaStolen = manaNuke:findValue("manaStolen");
	if not foundManaStolen then
		ManaStolen = 0;
	end
	manaNuke:addValue("manaStolen", ManaStolen + ManaPerCall);
	
	local ManaPoints = User:increaseAttrib("mana", -ManaPerCall);	
	if(ManaPoints <= 0) then
		doExplosion(manaNuke, User);
		return false;
	end
    return true;
end

function doExplosion(manaNuke, User)
	local foundManaStolen, ManaStolen = manaNuke:findValue("manaStolen");
	if not foundManaStolen then
		return;
	end
	local Range = common.Limit(0, 20, math.ceil(ManaStolen / 1000));
	local Damage = math.ceil(ManaStolen / 2);
	
	local minX = common.Limit(0, 1024, User.pos.x - Range);
	local maxX = common.Limit(0, 1024, User.pos.x + Range);
	local minY = common.Limit(0, 1024, User.pos.y - Range);
	local maxY = common.Limit(0, 1024, User.pos.y + Range);
	
	common.InformNLS(User, "[EXPLODINGNOWDE]", "[EXPLODINGNOWEN]");
	world:makeSound(1, User.pos);
	for x = minX, maxX do
		for y = minY, maxY do
			world:gfx(44, position(x, y, User.pos.z));
			if(world:isCharacterOnField(position(x, y, User.pos.z))) then
				local target = world:getCharacterOnField(position(x, y, User.pos.z));
				target:increaseAttrib("hitpoints", -Damage);
			end
		end
	end
end

function M.removeEffect(manaNuke, User)

end

return M

