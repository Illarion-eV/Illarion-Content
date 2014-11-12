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
-- Turns a weakened lich back to a normal one

local M = {}

function M.addEffect(theEffect, weakendLich)               				

end

function M.callEffect(theEffect, weakendLich) 

	weakendLich:increaseAttrib("hitpoints",-10000)
	local strongLich = world:createMonster(205,weakendLich.pos,-20)
	world:gfx(51,strongLich.pos)
	strongLich:talk(Character.say,"#me wird von einer unheiligen Flamme umhüllt und seine Knochen beginnen rot zu leuchten. 'Ich bin wieder da, närrische Sterbliche!', schreit er.","#me is enwrapped by an unholy flame and his bones start to glow red.'I am back, foolish mortals!', he cries.")
	world:makeSound(25,strongLich.pos)
	
	return false
end

function M.removeEffect(theEffect, weakendLich) 

end

function M.loadEffect(theEffect, weakendLich)           			

end
return M

