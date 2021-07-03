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
    if Character:getQuestProgress(325) == 1 and Character:getQuestProgress(345) == 0 then --Accepted tutorial messages, didn't visit the triggerfield yet
        Character:setQuestProgress(345, 1) --remember that the triggerfield was visited
        local callbackNewbie = function(informNewbie)
            Character:inform("An prominenter Stelle im Gasthaus zur Hanfschlinge befindet sich eine reich verzierte goldene Truhe, schimmerend vor Energie. Sie scheint bemerkenswerte Tiefen in sich zu beherbergen.","A highly embellished golden chest sits prominently in the Hemp Necktie Inn, shimmering with energy and seemingly harbouring remarkable depths.")
        end --end callback
        local dialogText = common.GetNLS(Character,
            "Hier im neutralen Gasthaus zur Hanfschlinge und auch in jeder Stadt findest du ein System mit mehreren Depots zur Aufbewahrung von Besitztümern. Mit einem Doppelklick kannst du auf das Depot zugreifen und Gegenstände in die Slots hinein- und herausziehen. Jedes Reich hat sein eigenes Lagersystem. Nur die Depots auf dem Markt am Gasthaus zur Hanfschlinge Zugang zu gelagerten Besitztümern außerhalb der Städte bieten.",
            "Here at the neutral Hemp Necktie Inn, and throughout each of the towns, you will find a system of several depots for storing possessions. Access the depot by double clicking it and drag items in and out of the slots. Each realm has their own storage system with only the depots in the market at the Hemp Necktie Inn giving access to stored possessions outside the towns.")
        local dialogNewbie = MessageDialog("Tutorial", dialogText, callbackNewbie)
        Character:requestMessageDialog(dialogNewbie)
    end
end

return M
