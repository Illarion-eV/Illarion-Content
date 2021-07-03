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
    if Character:getQuestProgress(325) == 1 and Character:getQuestProgress(344) == 0 then --Accepted tutorial messages, didn't visit the triggerfield yet
        Character:setQuestProgress(344, 1) --remember that the triggerfield was visited
        local callbackNewbie = function(informNewbie)
            Character:inform("Hinter der Taverne, umgeben von verwachsenen Weinreben, die üppige Trauben tragen und von Fässern des besten Jahrgangs gestützt werden, besteht kein Zweifel, dass der dortige Altar Adron dient. Vom charismatischen Adligen bis zum betrunkenen Bettler repräsentieren die flankierenden Statuen die Dichotomie von Adron.","Behind the tavern, set amongst tangled vines bearing bountiful bunches of grapes and backed by kegs of the finest vintage, there is little doubt the altar serves Adron. From charismatic noble to drunken beggar, the flanking statues represent the dichotomy of Adron.")
        end --end callback
        local dialogText = common.GetNLS(Character,
            "Im täglichen Leben in Illarion sind die Jüngeren Götter vorherrschend, wobei jedes Reich drei Schutzgottheiten hat, denen jeweils ein von einem Priester bedienten Tempel geweiht ist. Weitere Tempel und Schreine können im ganzen Land gefunden werden. Als Gott der Feste und des Weins wird Adron in der Regel unter Tavernenbesitzern und ihren fröhlichen Nachtschwärmern oder verzweifelten Betrunkenen gleichermaßen gefeiert.",
            "The Younger Gods dominate daily life in Illarion with each realm having three patron deities, each with a dedicated temple served by a priest. Other temples and shrines can be found throughout the lands. As the god of festivities and wine, Adron is typically celebrated amongst tavern owners and their jovial revellers or desperate drunks alike.")
        local dialogNewbie = MessageDialog("Tutorial", dialogText, callbackNewbie)
        Character:requestMessageDialog(dialogNewbie)
    end
end

return M
