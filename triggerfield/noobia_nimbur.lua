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

    if Character:getQuestProgress(325) == 1 and Character:getQuestProgress(331) == 0 then --Accepted tutorial messages, didn't visit the triggerfield yet
        Character:setQuestProgress(331, 1) --remember that the triggerfield was visited
        Character:inform("Ein beleibter Zwerg mit einem Becher in der Hand probiert vergnügt sein neuestes Gebräu. Erfreut genug um einen kleinen Schluck zu teilen, können aber die Hände, welche nach seinem geheimen Rezepten trachten, einen ordentlichen Hieb auf die Knöchel mit dem oft gebrauchten Löffel erwarten.","A rotund dwarf with mug in hand gleefully samples his latest brew. Pleased enough to share a tipple, any hands straying to his secret recipes can expect a sharp rap across the knuckles from his well used spoon.")
        local callbackNewbie = function() end --empty callback
        local dialogText = common.GetNLS(Character,
            "Illarion hat ein komplexes Handwerkssystem, das auf dem Sammeln und Veredeln von Rohstoffen basiert, welche bei der Herstellung zahlreicher Gegenstände verwendet werden, die in verschiedenen Skill basierten Handwerken zugeordnet sind. Jedes Reich ist auf verschiedene Handwerke ausgerichtet, was bedeutet, dass alle dafür notwendigen Werkzeuge zur Verfügung stehen, Ressourcen reichlich vorhanden sind und der Warenhandel zu höheren Preisen erfolgt.\n\nBefolge die Ratschläge von Nimbur Goldbrew, um zu lernen, wie du Ressourcen sammeln und Gegenstände herstellen kannst. Vielleicht findest du auch noch heraus, wie du dein erstes Monster tötest!",
            "Illarion has a complex crafting system based on gathering and refining raw materials which are used in the production of numerous items distributed across distinct skill-based crafts. Each realm has their speciality crafts, meaning all necessary tools are available for use, resources are more abundant, and goods trade at higher prices.\n\nFollow Nimbur Goldbrew's advice to learn how to gather resources and craft items. You may even find out how to kill your first monster!")
        local dialogNewbie = MessageDialog("Tutorial", dialogText, callbackNewbie)
        Character:requestMessageDialog(dialogNewbie)
    end
end

return M
