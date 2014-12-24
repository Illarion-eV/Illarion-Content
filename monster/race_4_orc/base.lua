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
msgs:addMessage("#me brüllt laut und kraftvoll.", "#me roars loudly and powerfully.")
msgs:addMessage("#me fletscht grässliche gelbe Zähne.", "#me bares ugly yellow teeth.")
msgs:addMessage("#me grunzt bösartig.", "#me grunts angrily.")
msgs:addMessage("#me knurrt leise und bedrohlich.", "#me snarls quietly and threateningly.")
msgs:addMessage("#me lacht heiser.", "#me laughs hoarsely.")
msgs:addMessage("#me spuckt auf den Boden, ein boßhaftes Grinsen auf dem Gesicht.", "#me spits at the ground, an evil grin stands in the face.")
msgs:addMessage("Bluuuuut!", "Bloooood!")
msgs:addMessage("D' Vatherr mit mirr ist!", "Da Fadha beh whib me!")
msgs:addMessage("Für d'n Vatherr von alle Orks!", "For da Fadha op all orcis!")
msgs:addMessage("Mirr zermatsch! Hurr! Hässliche Fresse!", "Me smash! Hurr! Ugly fais!")
msgs:addMessage("Renn wie Feigling, renn!", "Run coward, run!")
msgs:addMessage("Starr mirr nischt so an!", "Nub stare at me like dat!")
msgs:addMessage("Mir wütend. Mir dir nun auseinandernehmen wie Spinne! Mir dir zertreten wie Made!", "Me angry! Me smash yoos like spider. Mes stomp yoos like maggot!")
msgs:addMessage("#me schlägt sich an die Brust und röhrt heiser: 'In den Kampf, ein Ork drückt sich nicht!'", "#me slams his fist on his chest and roars: 'On dem! Orcis nub retreat!'")
msgs:addMessage("#me ist grün.", "#me is green.")

local M = {}

function M.generateCallbacks()
    return base.generateCallbacks(msgs)
end

return M