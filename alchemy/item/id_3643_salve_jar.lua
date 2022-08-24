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

local lookat = require("base.lookat")
local customPotion = require("alchemy.base.customPotion")
local alchemy = require("alchemy.base.alchemy")
local common = require("base.common")

local M = {}

local function applySalve(user, sourceItem)

    local potionEffectId = tonumber(sourceItem:getData("potionEffectId"))

    if potionEffectId == 0 or potionEffectId == nil  then -- no effect
        common.InformNLS(user, "Du hast nicht das Gefühl, dass etwas passiert.",
                               "You don't have the feeling that something happens.")
        return
    elseif potionEffectId == 700 then
        user:inform("Als du die Salbe auf deine Haut aufträgst, spürst du, wie Ausschläge, Verbrennungen oder Hautreizungen spürbar gelindert werden.", "As you apply the salve on your skin, you feel any rashes, burns or irritation of your skin get noticeably soothed.")
        return
    end
end

function M.UseItem(user, sourceItem, actionState)

    if sourceItem:getData("customPotion") ~= "" then
        customPotion.drinkInform(user, sourceItem)
    end

    if not sourceItem:getData("filledWith") == "salve" then
        return
    end

    local cauldron = alchemy.GetCauldronInfront(user)

    if cauldron then -- infront of a cauldron?
        alchemy.FillIntoCauldron(user,sourceItem,cauldron,actionState)

    else -- not infront of a cauldron, therefore drink!
        user:talk(Character.say, "#me trägt eine Salbe aus einem Tiegel auf.", "#me applies a salve from a jar.")
        user.movepoints = user.movepoints - 20
        applySalve(user, sourceItem) -- call effect
        alchemy.EmptyBottle(user, sourceItem)
    end
end

function M.LookAtItem(user,Item)
    return lookat.GenerateLookAt(user, Item, 0)
end

return M
