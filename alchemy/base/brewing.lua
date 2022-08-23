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
local shipmasterParchments = require("content.shipmasterParchments")
local M = {}

function M.UseItem(user, sourceItem, ltstate)
    if sourceItem:getData("parchmentMode") == "register" and user.name == "Teflon" then
        shipmasterParchments.setParchment(user, sourceItem)
        return
    elseif sourceItem:getData("parchmentMode") == "remove" and user.name == "Teflon" then
        shipmasterParchments.removeAll(user)
        return
    elseif sourceItem:getData("parchmentMode") == "found" and user.name == "Teflon" then
        shipmasterParchments.whatWasFound(user)
        return
    end
    -- no map items
    if sourceItem.wear == 255 then
        return
    end
    if not alchemy.getAlchemyTool(user) then
        alchemy.informAlchemyToolNeeded(user)
        return
    end
    local isPlant = alchemy.getPlantSubstance(sourceItem.id, user)
    local isGemDust = alchemy.CheckIfGemDust(sourceItem.id, user)
    if isPlant  or sourceItem.id == 157 then
        herbs.UseItem(user, sourceItem, ltstate)
    elseif isGemDust then
        gemdust.UseItem(user, sourceItem, ltstate)
    end
end

function M.LookAtItem(user, Item)

    if Item.id == 140 and Item:getData("teachDogTransformationPotion") ~= "" then
        return transformation_dog.LookAtDonfbladeMap(user, Item)
    end
    return lookat.GenerateLookAt(user, Item, lookat.NONE)
end
return M

