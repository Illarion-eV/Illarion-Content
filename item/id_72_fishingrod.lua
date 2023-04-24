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
-- UPDATE items SET itm_script='item.id_72_fishingrod' WHERE itm_id=72;

local common = require("base.common")
local fishing = require("craft.gathering.fishing")
local wood = require("item.general.wood")

local M = {}

M.LookAtItem = wood.LookAtItem

local function noShoal(user)
    common.HighInformNLS(user,
        "Hier scheinen sich keine Fische zu befinden. Halte Ausschau nach einem Fischschwarm.",
        "There doesn't seem to be any fish here. You should look for waters with a shoal.")
end

function M.UseItem(user, sourceItem, actionstate)

    local shoal = common.GetFrontItem(user)
    local targetPos = common.GetFrontPosition(user)
    local isWater = common.GetGroundType(world:getField(targetPos):tile()) == common.GroundType.water
    local isShoal = false

    if not isWater then -- fishing only possible on water tiles
        common.HighInformNLS(user,
        "Die Chance im Wasser einen Fisch zu fangen ist bedeutend höher als auf dem Land.",
        "The chance to catch a fish is much higher in the water than on the land.")
        return
    end

    if not shoal then -- there is no item at all
        noShoal(user)
        return
    end

    for _, shoalType in pairs(fishing.fishList) do

        if shoal.id == shoalType.depletedId then
            user:inform("Die wenigen Fische hier scheinen nicht anbeißen zu wollen. Finde einen anderen Schwarm oder warte, bis sich hier mehr angesiedelt haben.","The few fish here don't seem willing to be caught. Look for another shoal or wait until there are more fish here.",Character.highPriority)
            return
        end

        if shoal.id == shoalType.id then
            isShoal = true
            break
        end
    end


    if not isShoal then --there is an item but it is not a shoal
        noShoal(user)
        return
    end

    if user:getQuestProgress(688) ~= 1 then
        if user:getQuestProgress(718) == 3 or user:getQuestProgress(71) == 3 or common.Chance(1, 100) then
            common.InformNLS(user,
            "Müll gehört nicht ins Wasser. Du findest eine alte Pfanne, in der wohl früher mal Fische geräuchert wurden.",
            "Garbage doesn't belongs in the water. You find an old rusty pan that was used to smoke fish earlier.")
            user:setQuestProgress(688,1)
            common.CreateItem(user, 2495, 1, 117)
            return
        end
    end

    fishing.StartGathering(user, shoal, actionstate)
end

return M
