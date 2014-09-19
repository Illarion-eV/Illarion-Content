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
-- INSERT INTO triggerfields VALUES (340,216,0,'triggerfield.donation_galmair');
-- INSERT INTO triggerfields VALUES (340,217,0,'triggerfield.donation_galmair');
-- INSERT INTO triggerfields VALUES (339,216,0,'triggerfield.donation_galmair');
-- INSERT INTO triggerfields VALUES (339,217,0,'triggerfield.donation_galmair');

local common = require("base.common")
local donation_base = require("triggerfield.donation_base")

local M = {}

-- Donation to the Galmair treasury
-- 337, 217, 0 = Galmair

function M.PutItemOnField(Item,User)

    donated=donation_base.donate(Item,User,"Galmair","Valerio Guilianni","TreasureGalmair"); -- That's all folks


   -- Quest 206 (Galmair Treasury, NPC Geretel Goldhair)

    if (donated) and (User:getQuestProgress(206) == 1) then
		User:setQuestProgress(206, 2); --Quest solved!
		common.InformNLS(User,"[Queststatus] Du hast erfolgreich etwas an den Don gespendet. Sprich mit Gretel Goldhair, um deine Belohnung einzufordern.","[Quest status] You successfully made a donation to the Don. Talk to Gretel Goldhair to claim your reward."); --sending a message
	end

	-- Quest end

end

return M

