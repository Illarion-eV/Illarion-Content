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
-- Quest: As a Galmair Guard (155)
local common = require("base.common")

local M = {}

function M.MoveToField(char)
    if char:getType() ~= Character.player then
        return
    end
    
    if char.pos == position (368 , 250, 0) and char:getQuestProgress(155) == 1 then -- doing quest to read the rules of Galmair
        char:setQuestProgress(155, 2)
        common.InformNLS(char,"[Queststatus] Du hast die Regeln des Dons auf den Statuen vor Galmairs Krone gelesen. Kehre zu Boumaug zurück.", "[Quest status] You read the rules on the Don's statues in front of the Crest of Galmair. Return to Boumaug.")
    end
end
return M
