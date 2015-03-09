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
-- Quest: Zzarn'K Ska of Zelphia (501) - Saving Triggerfield events.
-- INSERT INTO triggerfields VALUES (638, 271, 0,'triggerfield.zzarnkskaofzelphia');
-- INSERT INTO triggerfields VALUES (636, 271, 0,'triggerfield.zzarnkskaofzelphia');
-- INSERT INTO triggerfields VALUES (636, 272, 0,'triggerfield.zzarnkskaofzelphia');
-- INSERT INTO triggerfields VALUES (636, 273, 0,'triggerfield.zzarnkskaofzelphia');
-- INSERT INTO triggerfields VALUES (636, 274, 0,'triggerfield.zzarnkskaofzelphia');
-- INSERT INTO triggerfields VALUES (722, 244, -9,'triggerfield.zzarnkskaofzelphia');
-- INSERT INTO triggerfields VALUES (723, 244, -9,'triggerfield.zzarnkskaofzelphia');
-- INSERT INTO triggerfields VALUES (782, 297, -9,'triggerfield.zzarnkskaofzelphia');

local common = require("base.common")

local M = {}

function M.MoveToField(User)

    if  User.pos == position(638, 271, 0) then -- Player found Lake of Life Dungeon entrance.
        User:warp(position(638, 271, -9))
    
	elseif User:isInRangeToPosition((position (636 , 271, 0)), 4) and User:getQuestProgress(501) == 1 then -- Player found Lake of Life Dungeon entrance.
        User:setQuestProgress(501, 2)
        common.InformNLS(User, "Du hast den Eingang zum See des Lebens gefunden. Kehre zu Salva zurück, du hast ihre Aufgabe erfüllt.", "You have found the entrance to the Lake of Life. Return to Ssalva, you have finished her task.")
		
	elseif User:isInRangeToPosition((position (722 , 244, -9)), 2) and User:getQuestProgress(501) == 4 then -- Player found Lake of Life Dungeon second Island.
	    User:setQuestProgress(501, 5)
        common.InformNLS(User, "Du hast die zweite Insel gefunden. Kehre zu Salva zurück, du hast ihre Aufgabe erfüllt.", "You have found the second island. Return to Ssalva, you have finished her task.")
	end

end


local altarPlate = position(782, 297, -9)


function M.PutItemOnField(Item,User)
    if  User:getQuestProgress(501) == 14 and Item.pos == altarPlate and Item.id == 767 then --  doing the quest - water blossom on the altar
	    world:gfx(46, Item.pos) -- nice GFX
        world:erase(Item, 1) -- delete the item
	    User:setQuestProgress(501, 15)
		common.InformNLS(User, "Du hast deine Gabe dargebracht. Kehre zu Salva zurück, du hast ihre Aufgabe erfüllt.", "You have placed your offering. Return to Ssalva, you have finished her task.")
        end
	end

return M

