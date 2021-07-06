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
local common = require("base.common")
local runes = require("magic.arcane.runes")
local magic = require("base.magic")
local M = {}

local function teachingDialog(user, target, spell)
    local manaCost = 5000
    local unknownRunes = 0
    local callback = function(dialog)
        if not dialog:getSuccess() then
            return
        end
        local index = dialog:getSelectedIndex() +1
        for i = 1,#runes.Runes do
            if not runes.checkIfLearnedRune(user,"", i, "isQuest") then
                unknownRunes = unknownRunes+1
            elseif index == i-unknownRunes then
                if  magic.hasSufficientMana(user,manaCost) then
                    if runes.checkIfLearnedRune(target,"", i, "isQuest") then
                        user:inform("","Target already knows that rune.")
                        return
                    end
                    user:increaseAttrib("mana", -manaCost)
                    world:gfx(41,target.pos)
                    world:makeSound(13,target.pos)
                    runes.learnRune(target,"", i, "isQuest")
                    target:inform("","You have learned how to use the rune "..runes.Runes[i][2]..".")
                    user:talk(Character.say, runes.Runes[i][2].." Bhona.")
                else
                    user:inform("","Not enough mana.")
                end
                return
            end
        end
    end
    local dialog = SelectionDialog(common.GetNLS(user,"","Teaching"), common.GetNLS(user,"","Select a rune to teach your target."), callback)
    for i = 1, #runes.Runes do
        if runes.checkIfLearnedRune(user,"", i, "isQuest") then
            dialog:addOption(0, runes.Runes[i][2])
        end
    end
user:requestSelectionDialog(dialog)
end

function M.teachRune(user, targeted, spell)
local target = targeted
    if not target.pos then
        if world:isCharacterOnField(target) then
            target = world:getCharacterOnField(target)
        else
            user:inform("","You need a target.")
            return
        end
    end
    if target:getType() == Character.monster or target:getType() == Character.npc then
        user:inform("","Target must be a player.")
    end
teachingDialog(user, target, spell)
end



return M
