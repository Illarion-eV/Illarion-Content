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
-- UPDATE common SET com_script='alchemy.item.id_331_green_bottle' WHERE com_itemid = 331;

-- Stocks
-- unfinished potions ("Herb Brew")

local common = require("base.common")
local id_165_blue_bottle = require("alchemy.item.id_165_blue_bottle")
local alchemy = require("alchemy.base.alchemy")
local lookat = require("base.lookat")
local customPotion = require("alchemy.base.customPotion")

local M = {}

local function DrinkIt(user, SourceItem)
    user:talk(Character.say, "#me trinkt eine gr�ne Fl�ssigkeit.", "#me drinks a green liquid.")
    common.InformNLS(user, "Du hast nicht das Gef�hl, dass etwas passiert.", "You don't have the feeling that something happens.")
    user.movepoints=user.movepoints - 20
end

local function FillStockIn(user,SourceItem, cauldron)
    -- water, stock or potion is in the cauldron; leads to a failure
    if cauldron:getData("filledWith") == "water" then
        alchemy.CauldronDestruction(user,cauldron,1)

    elseif cauldron:getData("filledWith") == "stock" then
        alchemy.CauldronDestruction(user,cauldron,2)

    elseif cauldron:getData("filledWith") == "potion" then
        if cauldron.id == 1013 then -- support potion
        id_165_blue_bottle.SupportStock(user,cauldron,SourceItem)
        else
            alchemy.CauldronExplosion(user,cauldron,2)
        end

    elseif cauldron:getData("filledWith") == "essenceBrew" then
        local check = alchemy.CombineStockEssence( user, SourceItem, cauldron)
        if check == false then
            return
        end
    elseif cauldron.id == 1008 then -- nothing in the cauldron, we just fill in the stock
    alchemy.FillFromTo(SourceItem,cauldron)
    world:changeItem(cauldron)
    end
end

function M.UseItem(user, SourceItem, ltstate)
    if SourceItem:getData("customPotion") ~= "" then
        customPotion.drinkInform(user, SourceItem)
    end

    if SourceItem:getData("filledWith") ~= "stock" then -- no stock, something else
        return

    else
        -- infront of a cauldron?
        local cauldron = alchemy.GetCauldronInfront(user)
        if cauldron then

            -- is the char an alchemist?
            local anAlchemist = alchemy.CheckIfAlchemist(user)
            if not anAlchemist then
                user:inform("Nur jene, die in die Kunst der Alchemie eingef�hrt worden sind, k�nnen hier ihr Werk vollrichten.","Only those who have been introduced to the art of alchemy are able to work here.")
                return
            end

            if not alchemy.checkFood(user) then
                return
            end

            if ( ltstate == Action.abort ) then
                common.InformNLS(user, "Du brichst deine Arbeit ab.", "You abort your work.")
               return
            end

            if ( ltstate == Action.none ) then
                local actionDuration
                if (SourceItem:getData("filledWith") =="stock") and (cauldron:getData("filledWith") == "essenceBrew") then
                    actionDuration = 80 -- when we combine a stock and an essence brew, it takes longer
                else
                    actionDuration = 20
                end
                user:startAction( actionDuration, 21, 5, 10, 45)
                return
            end

            FillStockIn(user,SourceItem,cauldron)
            alchemy.EmptyBottle(user,SourceItem)
            alchemy.lowerFood(user)
        else
            DrinkIt(user, SourceItem)
            alchemy.EmptyBottle(user,SourceItem)
        end
    end
end

function M.LookAtItem(user,Item)
    return lookat.GenerateLookAt(user, Item, 0)
end

return M
