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
local base = require("monster.base.base")
local messages = require("base.messages")

--Random Messages
local msgs = messages.Messages()
msgs:addMessage("#me bewegt sich flink auf und ab.", "#me moves up and down in an agile manner.")
msgs:addMessage("#me faucht agressiv.", "#me spits aggressively.")
msgs:addMessage("#me schüttelt einige Schuppen von seinem Rücken.", "#me loses some scales off his back.")
msgs:addMessage("#me zischt etwas unverständliches.", "#me hisses something unintelligible.")
msgs:addMessage("#mes Schwanz bewegt sich scheinbar unkontrolliert hin und her.", "#me's tail moves rapidly in a back and forth motion")
msgs:addMessage("Ich rieche Ärger...", "I smell trouble...")
msgs:addMessage("Sssssssss...", "Sssssssss...")
msgs:addMessage("Unssere Feinde sollen die Macht des Wassssssers zu spüren bekommen!", "Our enemiessss ssshould feel the power of water!")
msgs:addMessage("Unssere Rassssse wird überleben!", "Our race will sssssurvive!")
msgs:addMessage("Zshhel-pheey-arrr sssteht mir bei!", "Zshhel-pheey-arrr sssstands by me!")
msgs:addMessage("#me flüstert leise: 'Grossse Mutter, bereite mir ein Bad in deinem Tempel, ich werde bald zu dir stossssen!'.", "#me whispers: 'Great mother, prepare a bath for me in your templesss. I will sssoon come to yousss.'.")
msgs:addMessage("#me schlägt mit dem Schwanz drohend auf den Boden und zeigt seine spitzen Zähne, die gelben Augen sind zu schmalen Schlitzen verzogen.", "#me slams his tail on the ground and bares his sharp teeth. The yellow eyes are squinted to slits.")

local M = {}

function M.generateCallbacks()
    return base.generateCallbacks(msgs)
end

return M