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

--This script is for functions and information pertaining to the teaching of potions invented by characters

local common = require("base.common")

local alchemy = require("alchemy.base.alchemy")

local M = {}

local startQuest = alchemy.playerPotionStartQuest

local function getPotionNameById(user, id)
    return common.GetNLS(user, alchemy.potionName[id][2], alchemy.potionName[id][1])
end

function M.hasPlayerInventedAnyPotions(user)

    for _, potion in pairs(alchemy.playerInventedPotionList) do
        if potion.creator == user.name then
            return true
        end
    end

    return false
end

local function teachRecipe(user, target, potionIndex)
    common.writeBitwise(target, potionIndex, startQuest)
    user:inform("GERMAN HERE", "You successfully taught your target the recipe.")
    target:inform("GERMAN HERE", "Under your mentors wise tutelage, you now feel confident in brewing a new kind of potion.")
end

local function selectRecipeToTeach(user, target)

    local potionsToTeach = {}

    for _, potion in pairs(alchemy.playerInventedPotionList) do
        if user.name == potion.creator then
            local potionName = getPotionNameById(user, potion.id)
            table.insert(potionsToTeach, {name = potionName, index = potion.index})
        end
    end

    local callback = function(dialog)
        local success = dialog:getSuccess()

        if not success then
            return
        end

        local index = dialog:getSelectedIndex()+1

        if isValidChar(target) then
            teachRecipe(user, target, potionsToTeach[index].index)
        end
    end

    local dialog = SelectionDialog(common.GetNLS(user,"GERMAN TRANSLATION","Alchemy Teaching") , common.GetNLS(user,"GERMAN TRANSLATION","Select which potion recipe you want to teach your target.") , callback)

    for _, potion in ipairs(potionsToTeach) do
        dialog:addOption(0, potion.name)
    end

    user:requestSelectionDialog(dialog)
end

local function pickNearbyPlayer(user, cauldronPos)

    local players = common.ExtgetPlayersInRangeOf(cauldronPos, 2)
    local eligiblePlayers = {}

    for _, player in pairs(players) do
        if alchemy.CheckIfAlchemist(player) and player.name ~= user.name then
            table.insert(eligiblePlayers, player)
        end
    end

    local callback = function(dialog)
        local success = dialog:getSuccess()
        if not success then
            return
        end

        local index = dialog:getSelectedIndex()+1

        selectRecipeToTeach(user, eligiblePlayers[index])
    end

    local dialog = SelectionDialog(common.GetNLS(user,"GERMAN TRANSLATION","Alchemy Teaching") , common.GetNLS(user,"GERMAN TRANSLATION","Select who to teach the recipe to.") , callback)

    for _, player in ipairs(eligiblePlayers) do
        dialog:addOption(0, player.name)
    end

    if #eligiblePlayers == 0 then
        user:inform(common.GetNLS(user, "GERMAN TRANSLATION", "There's no one nearby qualified for you to teach."))
    else
        user:requestSelectionDialog(dialog)
    end
end

function M.dialogueToTeachPotions(user, cauldronPos)

    pickNearbyPlayer(user, cauldronPos)

end


return M
