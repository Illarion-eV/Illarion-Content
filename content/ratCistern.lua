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

-- This script handles the quest features of the rat quests in the cistern.


local common = require("base.common")

local dataCadomyr = "RatQuestCadomyr"
local dataGalmair = "RatQuestGalmair"
local dataRunewick = "RatQuestRunewick"

local M = {}

function M.checkCarrot(user,sourceItem)
    local numberOfCarrot
    local replacedCarrots = 0
    local countCarrots = 0
    local questTaken = false
    
    local inHand = user:getItemAt(4)
    local hitPoints = tonumber(user:increaseAttrib("hitpoints", 0))
    if inHand.id == 0 and  hitPoints > 750 then --bare hands
        if not common.IsNilOrEmpty(sourceItem:getData(dataCadomyr)) or not common.IsNilOrEmpty(sourceItem:getData(dataGalmair)) or  not common.IsNilOrEmpty(sourceItem:getData(dataRunewick)) then
            common.InformNLS(user,
                "Dir wird etwas schlecht und du bemerkst schnell, dass die Möhre voller Gift ist. Du wischst dir die ungeschützten Hände ab.",
                "Immediately you feel ill and see the carrot is full of poison. You clean your bare hands.")
            user:increaseAttrib("hitpoints", -250)
            return true
        end
    end
    
    if user:getQuestProgress(187) == 22 then
        numberOfCarrot = sourceItem:getData(dataCadomyr)
        if not common.IsNilOrEmpty(numberOfCarrot) then
            replacedCarrots = user:getQuestProgress(253)
            if not common.isBitSet(replacedCarrots,numberOfCarrot) then
                replacedCarrots = common.addBit(replacedCarrots,numberOfCarrot)
                user:setQuestProgress(253,replacedCarrots)
                countCarrots = common.countBit(replacedCarrots)
                if countCarrots == 5 then
                    user:setQuestProgress(187,23)
                    common.InformNLS(user,
                        "Auch die letzte vergiftete Möhre scheint unangetastet. Gehe zurück zu Jeremiah und berichte.",
                        "Also the last poisoned carrot seems untouched. Go back to Jeremiah and report.")
                else
                    common.InformNLS(user,
                        "Diese vergiftete Möhre scheint von den Ratten unangetastet. Finde noch " .. tostring(5-countCarrots) .. " weitere Möhren.",
                        "The rats didn't touch this poisoned carrot. You have to find " .. tostring(5-countCarrots) .. " more carrots.")
                end
                questTaken = true
            end
        end
    end
    
    return questTaken
end
--]]

return M
