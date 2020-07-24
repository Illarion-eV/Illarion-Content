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

-- UPDATE items SET itm_script='item.tree' WHERE itm_id IN (308, 586, 1804, 1807, 1808, 1809, 1817, 960, 961, 962, 963, 589,203,892,893,894,910,911,912,913,959,960,961,962,963,1193,1194,1195,1198,1807,1808);

local teacher = require("alchemy.base.teacher")
local common = require("base.common")
local lookat = require("base.lookat")
local herbgathering = require("craft.gathering.herbgathering")
local woodchopping = require("craft.gathering.woodchopping")

local M = {}

function M.UseItem(User, SourceItem, ltstate)
    -- alchemy stuff
    if SourceItem.pos == position(432,238,0) then
        teacher.UseItem(User, SourceItem, ltstate)
        return
    end
    -- alchemy end

    -- Try to harvest herbs first
    if herbgathering.isHerbItem(SourceItem) and
            herbgathering.GetValidProduct(SourceItem) and
            User:countItemAt("body",126) > 0 then
        herbgathering.StartGathering(User, SourceItem, ltstate);
        return;
    end

    if User:getRace() == 3 and User:increaseAttrib("sex", 0) == Character.male and world:getTime("month") == 5 and SourceItem.id == 962 then --Male elves using a Mevrannon tree during month Siros
        User:inform("Du steckst dir einen Mevrannonzweig an das Revers.","You put a Mevrannon twig on your lapel.")
        return
    end

    if woodchopping.isUnchoppableTree(SourceItem,User) then
        return
    end

    -- Try to chop tree
    if woodchopping.isChoppableTree(SourceItem) then
        woodchopping.StartGathering(User, SourceItem, ltstate);
        return;
    end

end

function M.LookAtItem(User,Item)
    -- alchemy stuff
    if Item.pos == position(432,238,0) then
        return teacher.LookAtItem(User, Item)

    end
    -- alchemy end

    if Item:getData("playerPlanted") ~= "" then
        lookat.SetSpecialDescription(Item, "Dieser Baum ist jung und steht noch nicht lange hier. Er trägt kaum Früchte und wird so gut wie kein Holz liefern.", "This young tree hasn't been around for a long time. It has just a few fruits and will yield close to no wood.")
        lookat.SetSpecialName(Item, "Junger Baum", "Young tree")
    end

    return lookat.GenerateLookAt(User, Item, lookat.NONE)

end

return M

