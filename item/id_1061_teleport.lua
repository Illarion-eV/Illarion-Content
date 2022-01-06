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
-- UPDATE items SET itm_script='item.id_1061_teleport' WHERE itm_id=1061;

local common = require("base.common")
local staticteleporter = require("base.static_teleporter")
local spatial = require("magic.arcane.spatial")
local texts = require("magic.arcane.base.texts")
local myTexts = texts.spatialTexts

local M = {}

function M.UseItem(user, SourceItem, actionState)
    if common.isInPrison(user.pos) then
        user:inform("Nichts passiert.", "Nothing happens.")
        return
    end

    local destCoordX = SourceItem:getData("destinationCoordsX")
    local destCoordY = SourceItem:getData("destinationCoordsY")
    local destCoordZ = SourceItem:getData("destinationCoordsZ")

    if staticteleporter.isBlocked(position(tonumber(destCoordX),tonumber(destCoordY),tonumber(destCoordZ))) then
        common.InformNLS( user,
        "Das Buch in deiner Hand schl�gt von alleine wieder zu!",
        "The book in your hand closes itself!" )
        return
    end

    local castDuration = spatial.getBookCastDuration(SourceItem)

    if actionState == Action.none then
        user:talk(Character.say, myTexts.portalBookChant.german, myTexts.portalBookChant.english)
        user:startAction(castDuration, 21, 10, 0, 0)
    elseif actionState == Action.abort then
        user:inform(common.GetNLS(user, myTexts.interruptedBook.german, myTexts.interruptedBook.english))
        return
    elseif actionState == Action.success then

        if (destCoordX ~= "") and (destCoordY ~= "") and (destCoordZ ~= "") then
            local radius = 4;
            local targetPos = common.getFreePos(user.pos, radius)

            if targetPos ~= user.Pos then
                -- create a gate
                local myPortal = world:createItemFromId( 10, 1, targetPos, true, 933, nil);
                myPortal:setData("destinationCoordsX", destCoordX)
                myPortal:setData("destinationCoordsY", destCoordY)
                myPortal:setData("destinationCoordsZ", destCoordZ)
                world:changeItem(myPortal)
                world:makeSound(4, targetPos)
            else -- no free space found
                common.InformNLS( user,
                "Rings um Dich erzittern Boden und Gegenst�nde!",
                "All around you ground and items are trembling!" )
            end

            world:erase(SourceItem, 1)
        end
    end
end

return M

