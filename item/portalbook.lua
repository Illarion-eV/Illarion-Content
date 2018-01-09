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
-- UPDATE items SET itm_script='item.portalbook' WHERE itm_id IN (1061, 3116);

local common = require("base.common")
local globalvar = require("base.globalvar")
local staticteleporter = require("base.static_teleporter")
local areas = require("content.areas")

local M = {}


local function writeLabel(user,bookItem)

    local title  = common.GetNLS(user, "Buchtitel", "Book Title")
    local infoText = common.GetNLS(user, "Füge hier den Text ein, mit dem du das Portalbuch beschriften willst.", "Insert the text you want to write on the portal book.")

    -- input dialog
    local callback = function(dialog)
        if not dialog:getSuccess() then
            -- player canceled the dialog; nothing
        else
            local labelText = dialog:getInput()
            bookItem:setData("descriptionDe",labelText)
            bookItem:setData("descriptionEn",labelText)
            world:changeItem(bookItem)
            user:inform("Du beschriftest das Portalbuch mit '"..labelText.."'.","You label the portal book as '"..labelText.."'.")
        end
    end
    local dialog = InputDialog(title, infoText, false, 100, callback)
    user:requestInputDialog(dialog)
end

function M.definePortalTarget(user)
    local book = common.GetItemInInventory(user, 1061, {{"freeDestination","true"},{"craftedBy",user.name}})
    if book == nil then
        common.HighInformNLS(user,"Du hast kein vorbereitetes Portalbuch bei dir.",
                                  "You don't have a prepared portal book with you.")
        return
    end
    if areas.PointInArea(user.pos, "Cadomyr") or areas.PointInArea(user.pos, "Galmair") or areas.PointInArea(user.pos, "Runewick") then
        user:increaseAttrib("mana", -10000)
        common.InformNLS(user,"Du spürst deutlich, dass du in einer Stadt keinen Erfolg haben kannst.",
                              "You clearly feel there is no success for such an ritual in a town.")
        return
    end
    if user:increaseAttrib("mana", 0) < 500 then
        common.HighInformNLS(user,"Du hast nicht genug Mana für dieses Ritual.",
                                  "You don't have sufficcient mana for such a ritual.")
    end
    book:setData("destCoordsX", user.pos.x)
    book:setData("destCoordsY", user.pos.y)
    book:setData("destCoordsZ", user.pos.z)
    book:setData("freeDestination", "false")
    book:setData("descriptionDe", "Aktiviertes Portal in die Wildnis")
    book:setData("descriptionEn", "Activated portal into the wilderness")
    world:changeItem(book)
    world:gfx(globalvar.gfxSTARS,user.pos)
    user:performAnimation(globalvar.charAnimationSPELL)
    writeLabel(user,book)
end

function M.UseItem(User, SourceItem, ltstate)
    if common.isInPrison(User.pos) then
        User:inform("Nichts passiert.", "Nothing happens.")
        return
    end

    local destCoordX = SourceItem:getData("destCoordsX")
    if common.IsNilOrEmpty(destCoordX) then
        destCoordX = SourceItem:getData("destinationCoordsX") -- old travel books
    end
    local destCoordY = SourceItem:getData("destCoordsY")
    if common.IsNilOrEmpty(destCoordY) then
        destCoordY = SourceItem:getData("destinationCoordsY") -- old travel books
    end
    local destCoordZ = SourceItem:getData("destCoordsZ")
    if common.IsNilOrEmpty(destCoordZ) then
        destCoordZ = SourceItem:getData("destinationCoordsZ") -- old travel books
    end
    local numberOfTraveller = SourceItem:getData("traveller")

    if (destCoordX ~= "") and (destCoordY ~= "") and (destCoordZ ~= "") then

        if common.IsNilOrEmpty(numberOfTraveller) then
            numberOfTraveller = 8
        end

        if staticteleporter.isBlocked(position(tonumber(destCoordX),tonumber(destCoordY),tonumber(destCoordZ))) then
            common.InformNLS( User,
            "Das Buch in deiner Hand schlägt von alleine wieder zu!",
            "The book in your hand closes itself!" )
            return
        end

        local radius = 4;
        local targetPos = common.getFreePos(User.pos, radius)

        if targetPos ~= User.Pos then
            -- create a gate
            local myPortal = world:createItemFromId( 10, 1, targetPos, true, 933, nil);
            myPortal:setData("destinationCoordsX", destCoordX)
            myPortal:setData("destinationCoordsY", destCoordY)
            myPortal:setData("destinationCoordsZ", destCoordZ)
            myPortal:setData("traveller", numberOfTraveller)
            world:changeItem(myPortal)
            world:makeSound(4, targetPos)

        else -- no free space found
            common.InformNLS( User,
            "Rings um Dich erzittern Boden und Gegenstände!",
            "All around you ground and items are trembling!" )
        end

        world:erase(SourceItem, 1)
    else
       -- no portal book
    end
end

return M

