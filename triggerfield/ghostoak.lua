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
-- Quest: The Ghost Oak (112)
require("base.common")

module("triggerfield.ghostoak", package.seeall)

function MoveToField(User)
	if User:getType() ~= Character.player then
		return
	end

   if (User:getQuestProgress(112) == 1) then
      base.common.InformNLS(User,
         "[Queststatus] Ein Schauer läuft dir den Rücken herunter, als du den Hain betrittst. Du hast die Geistereiche gefunden.",
         "[Quest status] A shiver runs down your spine as you enter the grove. This must be the ghost oak.");
      User:setQuestProgress(112, 2);
   end
end
