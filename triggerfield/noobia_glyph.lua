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
    if Character:getQuestProgress(325) == 1 and Character:getQuestProgress(346) == 0 then --Accepted tutorial messages, didn't visit the triggerfield yet
        Character:setQuestProgress(346, 1) --remember that the triggerfield was visited
        local callbackNewbie = function(informNewbie)
            Character:inform("Über einer funkelnden Brücke hinweg liegt eine mystische Insel, die von einem schimmernden Nebel umgeben ist. Energie wirbelt mit farbigen Lichtblitzen um einen komplizierten Ritualort, der in glitzernden Fels gehauen ist.","Across a sparkling bridge lies a mystical islet, shrouded in a shimmering mist. Energy swirls with bursts of coloured light around an intricate ritual site carved into glittering rock.")
        end --end callback
        local dialogText = common.GetNLS(Character,
            "Magie ist eine mysteriöse Begabung. Da die alten Wege des Arkanen für viele verloren sind, suchen jene mit Talent nach einem neuen Verständnis zu der alten Kunst des Glyphenschmiedens. Das rituelle Schmieden von Glyphen in Schmuck nutzt die magische Kraft, die jeder beschwören kann. Wenn du Glück hast, findest du möglicherweise einige der magischen Scherben, die sich zu diesen kostbaren Glyphen verbinden lassen.",
            "Magic is a mysterious calling. With the old ways of the arcane lost to many, those of talent seek a new understanding of the ancient art of glyph forging. Ritualistic forging of glyphs into jewellery harnesses magical power that can be invoked by anyone. If you are fortunate you may find some of the magical shards which combine to form these precious glyphs.  ")
        local dialogNewbie = MessageDialog("Tutorial", dialogText, callbackNewbie)
        Character:requestMessageDialog(dialogNewbie)
    end
end

return M
