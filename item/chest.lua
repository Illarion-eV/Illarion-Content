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

-- UPDATE items SET itm_script='item.chest' WHERE itm_id IN (1362,8,1367,1360,1362,1361);

local common = require("base.common")

local M = {}

local dragonCaveChestPos= {
    position(819, 676, -3),
    position(819, 674, -3),
    position(827, 655, -3),
    position(812, 650, -3),
    position(795, 617, -3),
    position(787, 631, -3),
	position(787, 632, -3),
	position(783, 640, -3),
	position(785, 657, -3),
	position(794, 668, -3), 
	position(783, 630, -3),
	position(782, 630, -3),
	position(664, 617, -3),
	position(662, 617, -3),
	position(705, 613, -6),
	position(703, 616, -6),
	position(704, 617, -6),
	}
	
function M.UseItem(User, SourceItem, ltstate)
	
	if (User:getQuestProgress(510) == 24) and  SourceItem.pos == position(783, 640, -3) then --OK, the player does the quest
        User:inform("In der Truhe liegt eine goldenes Amulet, das mit einem großen Smaragd geschmückt ist. Auf dem Stein ist ein goldenes Ein Zwergenwappen. Danach hatte Obsidimine gefragt.", "Inside the chest lays a golden amulet adorned with a large emerald. On the stone is a golden Dwarven coat of arms.  This is what Obsidimine was inquiring about.")
		User:setQuestProgress(510, 25)
    end
	
	for i = 1, #dragonCaveChestPos do
            if (SourceItem.pos == dragonCaveChestPos[i]) then
                ChestContents(User, SourceItem)
                return
            end
    end	
	
end

function ChestContents(User, chestItem)

    -- skip if already tripped in the last 5 minutes
    local serverTime = world:getTime("unix")
    local trippingTime = chestItem:getData("tripping_time")

    if (trippingTime ~= "" and ((tonumber(trippingTime) + 300) > serverTime)) then
        User:inform("Du findest nichts in diesem Fass.",
                    "You find nothing inside this barrel.")
        return
    end
    -- safe tripping time
    chestItem:setData("tripping_time", serverTime)
    world:changeItem(chestItem)
        
	local random_number = math.random(1,100)
	if random_number >= 0 and random_number <= 35 then
	    User:inform("Du suchst bis zum Boden, findest aber nicht als Rattenkot.", "You search to the bottom but find nothing but rat droppings.")
	elseif random_number >= 36 and random_number <= 70 then
	    User:inform("Als Du suchst, findest Du einen Stapel Geldbörsen - aber alle sind leer.", "As you search, you find a stash of money bags, that are all empty.")
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
		local monPos = common.getFreePos(chestItem.pos, 2) -- radius 2 around vase
            world:createMonster(211, monPos, -20)
            world:gfx(41, monPos) -- swirly
            User:inform("Während Du suchst, schleicht irgendwas aus den Schatten um dich herum.",
                "As you are searching, something sneaks in from the shadows around you.")
	   end
	end
return M

