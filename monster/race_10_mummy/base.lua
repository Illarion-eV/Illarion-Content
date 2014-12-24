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
msgs:addMessage("#me atmet laut ein und aus.", "#me takes deep breaths.")
msgs:addMessage("#me ist mit Wunden übersäht", "#me is littered with wounds.")
msgs:addMessage("#me macht ächzende Geräusche.", "#me makes groaning noises.")
msgs:addMessage("#me spuckt etwas Blut auf den Boden.", "#me spits out some blood.")
msgs:addMessage("#me starrt ins Leere.", "#me stares into oblivion.")
msgs:addMessage("#me stöhnt unter Schmerzen.", "#me moans with pain.")
msgs:addMessage("#me torkelt.", "#me staggers.")
msgs:addMessage("#me wackelt etwas unsicher.", "#me is a bit unsteady on its feet.")
msgs:addMessage("Hiiirne!", "Braaains!")
msgs:addMessage("Komm... zu... uns...", "Join... us...")
msgs:addMessage("#me fährt sich mit einer klauenhaften Hand murmelnd über den pilzbefallenen Kopf, ehe er ein schlürfendes Geräusch von sich gibt.", "#me runs with claw-like hands over its fungus-stricken head as it makes a shuffling noise.")
msgs:addMessage("#me weist einige schwere Wunden auf, weshalb er nur schwerfällig vorwärts kommt. Als er allerdings die zerfallende Nase reckt, scheint mehr 'Leben' in ihn zurückzukehren.", "#me has severe wounds, it moves very slowly. But as it stretches its disintegrating nose, more 'life' seems to come back into it.")
msgs:addMessage("#me tropft dicklicher Speichel aus dem Mundwinkel und seine milchigen Augen starren trübsinnig drein, während ihm unverständliche Worte entfläuchen.", "#me drops syrupy saliva from its mouth and its eyes stare gloomily as it speaks unintelligible words.")
msgs:addMessage("#me stöhnt schwer und beugt sich vornüber, eine schwarze Flüssigkeit zu Boden spuckend. Danach richtet er sich wieder auf und haftet den Blick gebannt auf das Opfer.", "#me groans heavily and leans forward, spitting a black liquid on the floor. Then it straightens up and affixes its eyes on the victim.")

local M = {}

function M.generateCallbacks()
    return base.generateCallbacks(msgs)
end

return M