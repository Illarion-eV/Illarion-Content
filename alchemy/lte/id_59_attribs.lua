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
-- LTE für das Druidensystem
-- by Falk
local common = require("base.common")

local M = {}

-- INSERT INTO longtimeeffects VALUES (59, 'alchemy_attribs', 'alchemy.lte.id_59_attribs');

local attribList ={"strength","willpower","perception","intelligence","constitution","agility","dexterity","essence"};
local bottomBorder = 1;

function M.addEffect(Effect, User)
 
end

function M.callEffect(Effect,User)
    -- callEffect is only called once; we just need to return false
	local find_i,sight = Effect:findValue("sightpotion")
	if find then
	    common.InformNLS( User, "Deine Augen fühlen sich wieder normal an.", "Your eyes feel normal again.")
	else
		common.InformNLS( User, "Du fühlst, dass der Stärkungstrank seine Wirkung verliert.", "You feel that the strengthening potion looses its effect.")
	end
	return false

end

function M.removeEffect(Effect,User)
    -- restore the attributes
	
	local find_i,sight = Effect:findValue("sightpotion")
	if not find then
		local find_i, attrib_i, attribValue
		for i=1,8 do
			find_i,attrib_i = Effect:findValue(""..attribList[i])
			if find_i then
				attribValue = attrib_i - 5 
				User:increaseAttrib(attribList[i],-attribValue);
			end
		end
	end
end

function M.loadEffect(Effect,User)
    -- login, we have to change the attributes again
	local find_i,sight = Effect:findValue("sightpotion")
	if not find then
		local find_i, attrib_i
		for i=1,8 do
			find_i,attrib_i = Effect:findValue(""..attribList[i])
			if find_i then
				User:increaseAttrib(attribList[i],attrib_i - 5)
			end	
		end
	end
end
return M

