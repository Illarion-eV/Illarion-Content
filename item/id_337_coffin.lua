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

-- UPDATE items SET itm_script='item.id_337_coffin' WHERE itm_id IN (337);

local common = require("base.common")

local M = {}

local dragonCaveCoffinPos = {
    position(695, 612, -3),
    position(696, 612, -3),
    position(697, 612, -3),
    position(698, 612, -3),
    position(699, 612, -3),
    position(700, 612, -3),
    position(701, 612, -3),
    position(702, 612, -3),
    position(703, 612, -3),
    position(704, 612, -3),
	position(706, 621, -3),
	position(706, 623, -3),
	position(706, 625, -3),
	position(707, 621, -3),
	position(707, 623, -3),
	position(707, 625, -3),
	position(708, 621, -3),
	position(708, 623, -3),
	position(708, 625, -3),
	position(709, 621, -3),
	position(709, 623, -3),
	position(709, 625, -3),
	position(709, 623, -3),
	position(809, 651, -3),
	position(810, 651, -3),
	}

function M.UseItem(User, SourceItem)

   	if (User:getQuestProgress(510) == 21) and  SourceItem.pos == position(703, 612, -3) then --OK, the player does the quest
        User:inform("", "Inside the coffin you find the remains of the dwarf from the vision.  You take the detached skull as proof for Obsidimine.")
		User:setQuestProgress(510, 22)
    end
	
	for i = 1, #dragonCaveCoffinPos do
            if (SourceItem.pos == dragonCaveCoffinPos[i]) then
                CoffinContents(User, SourceItem)
                return
            end
        end	
end

function CoffinContents(User, coffinItem)

    -- skip if already tripped in the last 5 minutes
    local serverTime = world:getTime("unix")
    local trippingTime = coffinItem:getData("tripping_time")

    if (trippingTime ~= "" and ((tonumber(trippingTime) + 300) > serverTime)) then
        User:inform("Du findest nichts in diesem Sarg.","You find nothing inside this coffin.")
        return
    end
    -- safe tripping time
    coffinItem:setData("tripping_time", serverTime)
    world:changeItem(coffinItem)
        
	local random_number = math.random(1,100)
	if random_number >= 0 and random_number <= 35 then
	    User:inform("", "The smell hits your nose before you can see inside, you drop the lid unable to open it any further.")
	elseif random_number >= 36 and random_number <= 70 then
	    User:inform("", "The remains in the coffin are ancient and mummified.  Who or what they once were is unknown.")
	elseif random_number >= 71 and random_number <= 90 then
        User:inform("","You quickly glance in the coffin and discover a simple dagger which you take for your own.")
		local notCreated = User:createItem(27, 1, 333, nil) -- simple dagger
        if ( notCreated > 0 ) then -- too many items -> character can't carry anymore
            world:createItemFromId(27, notCreated, User.pos, true, 333, nil)
            common.HighInformNLS(User,"Du kannst nichts mehr halten.","You can't carry any more.")
			end
	elseif random_number >= 91 and random_number <=100 then
		local monPos = common.getFreePos(coffinItem.pos, 2) -- radius 2 around vase
            world:createMonster(754, monPos, -20)
            world:gfx(41, monPos) -- swirly
            User:inform("",
                "You disturb the remains in the coffin and they attack!")
	   end
    end

return M
