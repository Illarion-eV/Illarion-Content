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
-- ALCHEMY
-- reworked version
-- bases upon Falk's original script
-- by Merung

local alchemy = require("alchemy.base.alchemy")
local herbs = require("alchemy.base.herbs")
local gemdust = require("alchemy.base.gemdust")
local transformation_dog = require("alchemy.teaching.transformation_dog")
local lookat = require("base.lookat")
local M = {}

function M.UseItem(User, SourceItem, ltstate)
    -- no map items
	if SourceItem.wear == 255 then
	    return
	end	
	local isPlant, ignoreIt = alchemy.getPlantSubstance(SourceItem.id, User)
	local isGemDust = alchemy.CheckIfGemDust(SourceItem.id, User)
	if isPlant  or SourceItem.id == 157 then
	    herbs.UseItem(User, SourceItem, ltstate)
	elseif isGemDust then
	    gemdust.UseItem(User, SourceItem, ltstate)
	end
end

function M.LookAtItem(User, Item)

	if Item.id == 140 and Item:getData("teachDogTransformationPotion") ~= "" then
		return transformation_dog.LookAtDonfbladeMap(User, Item)
	end
	return lookat.GenerateLookAt(User, Item, lookat.NONE)
end
return M

