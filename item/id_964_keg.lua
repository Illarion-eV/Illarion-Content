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

-- UPDATE items SET itm_script='item.id_964_keg' WHERE itm_id IN (964);

local common = require("base.common")

local M = {}

local dragonCaveKegPos= {
    position(710, 632, -3),
    position(685, 610, -3),
    position(684, 610, -3),
    position(677, 615, -3),
	}
	
function M.UseItem(User, SourceItem, ltstate)
	
	for i = 1, #dragonCaveKegPos do
            if (SourceItem.pos == dragonCaveKegPos[i]) then
                KegContents(User, SourceItem)
                return
            end
    end	
	
end

function KegContents(User, kegItem)

    -- skip if already tripped in the last 5 minutes
    local serverTime = world:getTime("unix")
    local trippingTime = kegItem:getData("tripping_time")

    if (trippingTime ~= "" and ((tonumber(trippingTime) + 300) > serverTime)) then
        User:inform("Du findest nichts in diesem Fass.",
                    "You find nothing inside this barrel.")
        return
    end
    -- safe tripping time
    kegItem:setData("tripping_time", serverTime)
    world:changeItem(kegItem)
        
	local random_number = math.random(1,100)
	if random_number >= 0 and random_number <= 35 then
	    User:inform("Du suchst bis zum Boden, findest aber nicht als Rattenkot.", "You search to the bottom but find nothing but rat droppings.")
	elseif random_number >= 36 and random_number <= 70 then
	    User:inform("Als Du suchst, findest Du einen Stapel Geldbörsen - aber alle sind leer.", "As you search you find a stash of money bags, that are all empty.")
	elseif random_number >= 71 and random_number <= 90 then
        User:inform("Du findest eine Silbermünze.","You discover a silver coin.")
		local notCreated = User:createItem(3077, 1, 333, nil) -- silver coin
        if ( notCreated > 0 ) then -- too many items -> character can't carry anymore
            world:createItemFromId(3077, notCreated, User.pos, true, 333, nil)
            common.HighInformNLS(User,
                "Du kannst nichts mehr halten.",
                "You can't carry any more.")
			end
	elseif random_number >= 91 and random_number <=100 then
		local monPos = common.getFreePos(kegItem.pos, 2) -- radius 2 around vase
            world:createMonster(211, monPos, -20)
            world:gfx(41, monPos) -- swirly
            User:inform("Während Du suchst, schleicht irgendwas aus den Schatten um dich herum.",
                "As you are searching, something sneaks in from the shadows around you.")
	   end
	end
return M

