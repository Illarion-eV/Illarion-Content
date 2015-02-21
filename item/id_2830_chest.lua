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
-- UPDATE items SET itm_script='item.id_2830_chest' WHERE itm_id=2830;

local common = require("base.common")
local treasureContent = require("content.treasure")
local treasureBase = require("item.base.treasure")
local lookat = require("base.lookat")
local M = {}

function M.LookAtItem(User, Item)
    --local nameDe, nameEn = treasureContent.getTreasureName(tonumber(Item:getData("trsCat")))
	local nameDe, nameEn = "Eine kunstvoll verzierte Schatzkiste. Welche Reichtümer mag sie wohl enthalten?", "An ornated treasure chest. What riches will it contain?"
	lookat.SetSpecialDescription(Item, nameDe, nameEn);
	return lookat.GenerateLookAt(User, Item, lookat.NONE)
end

function M.UseItem(User,SourceItem)

    local level=tonumber(SourceItem:getData("trsCat"))
    local posi=SourceItem.pos;

    common.InformNLS(User, "Du öffnest die Schatzkiste...", "You open the treasure chest...");
	world:erase(SourceItem, SourceItem.number); --strange hack here
	if (level ~= nil) and (level~=0) and (level < 10) then
        world:gfx(16,posi);
        world:makeSound(13,posi);
        treasureBase.dropTreasureItems(posi, level);
	else	
        common.InformNLS(User, "...sie ist leer!", "...it is empty!");
    end

end


return M

