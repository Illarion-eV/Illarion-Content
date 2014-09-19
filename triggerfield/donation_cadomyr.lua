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
-- INSERT INTO triggerfields VALUES (115,520,0,'triggerfield.donation_cadomyr');
-- INSERT INTO triggerfields VALUES (115,521,0,'triggerfield.donation_cadomyr');
-- INSERT INTO triggerfields VALUES (116,520,0,'triggerfield.donation_cadomyr');
-- INSERT INTO triggerfields VALUES (116,521,0,'triggerfield.donation_cadomyr');

local common = require("base.common")
local donation_base = require("triggerfield.donation_base")

local M = {}

-- Donation to the Cadomyr treasury
-- 115, 552, 0 = Cadomyr

function M.PutItemOnField(Item,User)

    donated=donation_base.donate(Item,User,"Cadomyr","Rosaline Edwards","TreasureCadomyr"); -- That's all folks
	
	-- Quest 151 (Cadomyr Treasury, NPC Ioannes Faber)

    if (donated) and (User:getQuestProgress(151) == 1) then
		User:setQuestProgress(151, 2); --Quest solved!
		common.InformNLS(User,"[Queststatus] Du hast den Befehl erfolgreich ausgeführt. Kehre zu Ioannes Faber zurück, um deine Belohnung einzufordern.","[Quest status] You completed your task successfully. Return to Ioannes Faber to claim your reward."); --sending a message
	end
	
	-- Quest end
	
end
return M

