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

local bookCastTime = 200 -- When portal magic is implemented, this will be replaced by a calculation based on the cast time mages take to cast a portal and the quality of the book as they will be craftable by mages

local M = {}

function M.actionDisturbed(user, attacker)
    user:inform("Du solltest dich erstmal mit deinem Angreifer befassen, bevor du versuchst, den Zauberspruch des Portalbuchs zu lesen.", "You should deal with your attacker before trying to read the chant of the portal book.")
    return true
end

function M.UseItem(user, sourceItem, actionState)

    if common.isInPrison(user.pos) then
        user:inform("Nichts passiert.", "Nothing happens.")
        return
    end

    local destCoordX = sourceItem:getData("destinationCoordsX")
    local destCoordY = sourceItem:getData("destinationCoordsY")
    local destCoordZ = sourceItem:getData("destinationCoordsZ")

    --Ensure the book has valid coordinates
    if common.IsNilOrEmpty(destCoordX) or common.IsNilOrEmpty(destCoordY) or common.IsNilOrEmpty(destCoordZ) then
        return
    end

    if staticteleporter.isBlocked(position(tonumber(destCoordX),tonumber(destCoordY),tonumber(destCoordZ))) then
        common.InformNLS( user,
        "Das Buch in deiner Hand schlägt von alleine wieder zu!",
        "The book in your hand closes itself!" )
        return
    end

    --Time to check whether casting has started
    if actionState == Action.none then

        user:talk(Character.say, "#me beginnt, den Zauberspruch eines Portalbuches zu lesen.", "#me begins chanting the incantation written in a portal book.")
        user:startAction(bookCastTime, 21, 10, 0, 0)

    elseif actionState == Action.abort then

        user:inform(common.GetNLS(user, "Du wurdest beim Lesen des Zauberspruches des Portalbuches unterbrochen.", "Your reading of the portal books incantation was interrupted."))
        return

    elseif actionState == Action.success then

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
            "Rings um Dich erzittern Boden und Gegenstände!",
            "All around you ground and items are trembling!" )
        end

        world:erase(sourceItem, 1)
    end
end

return M

