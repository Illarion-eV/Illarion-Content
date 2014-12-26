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

function getWell(User)

	local WELL = 2207;
	local item = common.GetFrontItem(User);
	if (item ~= nil and item.id == WELL) then
		return item;
	end
	item = common.GetItemInArea(User.pos, WELL);
	return item;
end

function getHole(User)

	local HOLE = 1206;
	local item = common.GetFrontItem(User);
	if (item ~= nil and item.id == HOLE) then
		return item;
	end
	item = common.GetItemInArea(User.pos, HOLE);
	return item;
end


function M.climbDown(User)


	-- climb down a well
	local TargetItem = getWell(User);
	if TargetItem ~= nil then
		common.TurnTo(User, TargetItem.pos);
		if (TargetItem.pos == position(528, 555, 0)) then --maze
			User:talk(Character.say, "#me klettert an einem Seil den Brunnen hinunter.", "#me climbs down into the well on a rope.")
			User:warp(position(518, 559, -3));
		elseif (TargetItem.pos == position(105, 600, 0)) then --Cadomyr
			User:talk(Character.say, "#me klettert an einem Seil den Brunnen hinunter.", "#me climbs down into the well on a rope.")
			User:warp(position(106, 582, -6));
		elseif (TargetItem.pos == position(357, 272, 0)) then --Galmair
			User:talk(Character.say, "#me klettert an einem Seil den Brunnen hinunter.", "#me climbs down into the well on a rope.")
			User:warp(position(359, 481, -6));
		elseif (TargetItem.pos == position(849, 841, 0)) then --Runewick
			User:talk(Character.say, "#me klettert an einem Seil den Brunnen hinunter.", "#me climbs down into the well on a rope.")
			User:warp(position(838, 823, -3));
		else
			common.InformNLS( User,
				"Das Wasser steht recht hoch im Brunnen. Hier hinein zu klettern bringt nichts.",
				"The water is rather high in the well. To climb in here is useless.");
		end
		return;
	end

	-- ... or perhaps climb down a hole.
	TargetItem = getHole(User);
	if TargetItem ~= nil then
		common.TurnTo(User, TargetItem.pos);
		if (TargetItem.pos == position(854, 414, 0)) then
			User:talk(Character.say, "#me klettert an einem Seil in das dunkle Loch hinab.", "#me climbs down into the dark hole on a rope.")
			User:warp(position(925, 518, -6));
		end
		return;
	end
end

return M