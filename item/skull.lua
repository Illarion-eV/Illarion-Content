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
require("base.common")

-- UPDATE common SET com_script='item.skull' WHERE com_itemid = 2038;
-- UPDATE common SET com_script='item.skull' WHERE com_itemid = 2039;

module("item.skull", package.seeall)


function UseItem(User, SourceItem)
	-- Evilrock skulls
	local skullSourceItemPos={position(989,247,0),position(990,241,0),position(997,226,0)}
	local typoOfFlame={359,360,372}

	for i = 1, #skullSourceItemPos do
		if (SourceItem.pos == skullSourceItemPos[i]) then
			local flame = typoOfFlame[i]
			BlowOutFlames(User,flame)
			if User:getQuestProgress(668) ~= 1 then
				User:inform("Nichts passiert als du die Finger in die Augenhöhlen des Schädels reinsteckst.", "Nothing happens as you put your fingers into the eye holes of the skull.")
			end
			User:setQuestProgress(668,0)
		end
	end
end

function BlowOutFlames(User,flame)

	for xx=986,998 do
		for yy=211,235 do
			local positionFlame = position(xx,yy,0)
			local checkFlame = world:getItemOnField(positionFlame)
			if checkFlame.id == flame then
				world:erase(checkFlame,checkFlame.number)
				world:makeSound(13,User.pos)
				if User:getQuestProgress(668) ~= 1 then
					User:setQuestProgress(668,1)
				end
			end
		end
	end
end

