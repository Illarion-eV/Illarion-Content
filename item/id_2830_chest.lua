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
-- UPDATE items SET itm_script='item.id_2830_chest' WHERE itm_id=2830

local common = require("base.common")
local treasureContent = require("content.treasure")
local treasureBase = require("item.base.treasure")
local lookat = require("base.lookat")
local M = {}

function M.LookAtItem(User, Item)
    --local nameDe, nameEn = treasureContent.getTreasureName(tonumber(Item:getData("trsCat")))
    local nameDe, nameEn = "Eine kunstvoll verzierte Schatzkiste. Welche Reichtümer mag sie wohl enthalten?", "An ornated treasure chest. What riches will it contain?"
    lookat.SetSpecialDescription(Item, nameDe, nameEn)
    return lookat.GenerateLookAt(User, Item, lookat.NONE)
end

function M.UseItem(User,SourceItem)
    local RANGE_PLAYER_HAVE_TO_BE = 1
    local level=tonumber(SourceItem:getData("trsCat"))
    local playerNeeded=tonumber(SourceItem:getData("playerNeeded"))
    local posi=SourceItem.pos
    local playerInRange=world:getPlayersInRangeOf(posi ,RANGE_PLAYER_HAVE_TO_BE )

    if (playerNeeded == nil) then
        playerNeeded = 1
    end
    if (#playerInRange >= playerNeeded) then
        if playerNeeded == 1 then
            common.InformNLS(User, "Du öffnest die Schatzkiste...", "You open the treasure chest...")
        else
            for _, player in pairs(playerInRange) do
                common.InformNLS(player, "Zusammen schafft ihr es den Schließmechanismus der Schatzkiste zu knacken.",
                                       "Together you break tle lock of the treasure chest.")
            end
        end
        world:erase(SourceItem, SourceItem.number) --strange hack here
        if (level ~= nil) and (level~=0) and (level < 10) then
            world:gfx(16,posi)
            world:makeSound(13,posi)
            treasureBase.dropTreasureItems(posi, level)
        else    
            common.InformNLS(User, "...sie ist leer!", "...it is empty!")
        end
    else
        common.InformNLS(User,
        "Um den Mechanismus dieser Kiste zu überwinden benötigst du mindestens "..tostring(playerNeeded * 2).." Hände.",
        "To open the mechanism of this chest you need at least "..tostring(playerNeeded * 2).." hands.")
    end

end


return M

