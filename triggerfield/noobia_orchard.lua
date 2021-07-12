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

local M = {}

function M.MoveToField(Character)
    if Character:getQuestProgress(325) == 1 and Character:getQuestProgress(353) == 0 then --Accepted tutorial messages, didn't visit the triggerfield yet
        Character:setQuestProgress(353, 1) --remember that the triggerfield was visited
        local callbackNewbie = function(informNewbie)
            Character:inform("Ein kleiner Baumhain auf der Landzunge bietet schattige Ruhe vor dem geschäftigen Hafen. Das Rascheln zwischen den Blättern lässt jedoch darauf schließen, dass die reichlich vorhandenen Früchte dieses Obstgartens auch andere Besucher angezogen haben könnten.","A small grove of trees planted on the headland provides shady tranquility from the bustling harbour. Rustling amongt the leaves, however, suggests the abundant fruit of this orchard might also have attracted other visitors.")
        end --end callback
        local dialogText = common.GetNLS(Character,
            "Das Sammeln von Ressourcen erfordert normalerweise ein spezielles Handwerkzeug, aber Obst kann ohne Hilfe gepflückt werden. Du kannst Äpfel sammeln, indem du vor einem Apfelbaum stehst und auf diesen doppelklickst. Das Ressourcenangebot ist begrenzt und sobald eine Quelle erschöpft ist, braucht sie Zeit, um sich wieder aufzufüllen. Wenn der von dir ausgewählte Baum nicht genügend Äpfel enthält oder du ein paar gegessen hast, versuch es mit einem anderen Baum. Wenn du ein Lebensmittel verwendest, wird es verbraucht, um den gelben Balken in der unteren rechten Ecke des Fensters aufzufüllen.\n\nBleib immer wachsam, da deine Aktionen manchmal Ereignisse auslösen können. Solltest du beim Obstpflücken einige der einheimischen Wildtiere stören, könntest du angegriffen werden.",
            "Gathering resources usually requires a designated hand tool but fruit can be picked unaided. You can collect apples by standing in front of an apple tree and double clicking on it. Resource supply is limited and once exhausted a source takes time to replenish. If the tree you have selected lacks sufficient apples or you eat some, try another tree. Using a food item consumes it to replenish the yellow bar in the bottom right corner of the window.\n\nBe sure to stay alert as your actions can sometimes trigger events. Should you disturb some of the local wildlife as you are picking fruit, you could be attacked.")
        local dialogNewbie = MessageDialog("Tutorial", dialogText, callbackNewbie)
        Character:requestMessageDialog(dialogNewbie)
    end
end

return M
