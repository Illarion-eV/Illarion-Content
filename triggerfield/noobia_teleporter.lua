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
    if Character:getQuestProgress(325) == 1 and Character:getQuestProgress(348) == 0 then --Accepted tutorial messages, didn't visit the triggerfield yet
        Character:setQuestProgress(348, 1) --remember that the triggerfield was visited
        local callbackNewbie = function(informNewbie)
            Character:inform("Vor Energie geladen knistert die Luft rundum das mit Marmor verzierte Pult. Darauf liegt eine vergilbte und oft benutzte Schriftrolle, auf der sehr ordentlich niedergeschrieben eine Reihe von Zielorten angegeben sind.","The air crackles with energy around an ornate marble podium. A neatly scribed, albeit somewhat discoloured and well-used pell sits on the podium listing a number of destinations.")
        end --end callback
        local dialogText = common.GetNLS(Character,
            "Hier im neutralen Gasthof zur Hanfschlinge, sowie vor dem Eingang zu jeder Stadt, gibt es einen Teleporter. Mit einem Doppelklick auf das Pult kannst du es zu verwenden und für den Preis von fünf Silbermünzen kannst du in ein anderes Reich reisen. Portalbücher können für zehn Silber gekauft werden, um dich von einer beliebigen Stelle auf der Karte zu einem bestimmten Teleporter zu bringen.  Auf dem Vorplatz der Taverne verkauft Lobely Portalbücher an seinem Stand.",
            "Here at the neutral Hemp Necktie Inn, as well as outside the entrance to each of the towns, there is a teleporter. Double click on the podium to use it and for five silver you will be able to travel to another realm. Portal books can also be bought for ten silver to use anywhere on the map to transport you to a designated teleporter. Lobely sells portal books from his stall in the tavern forecourt.")
        local dialogNewbie = MessageDialog("Tutorial", dialogText, callbackNewbie)
        Character:requestMessageDialog(dialogNewbie)
    end
end

return M
