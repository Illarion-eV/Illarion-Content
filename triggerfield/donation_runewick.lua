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
-- INSERT INTO triggerfields VALUES (897,779,2,'triggerfield.donation_runewick');
-- INSERT INTO triggerfields VALUES (897,780,2,'triggerfield.donation_runewick');
-- INSERT INTO triggerfields VALUES (896,779,2,'triggerfield.donation_runewick');
-- INSERT INTO triggerfields VALUES (896,780,2,'triggerfield.donation_runewick');

local common = require("base.common")
local donation_base = require("triggerfield.donation_base")

local M = {}

-- Donation to the Runewick treasury
-- 898, 779, 2 = Runewick

function M.PutItemOnField(Item,User)

    donated=donation_base.donate(Item,User,"Runewick","Elvaine Morgan","TreasureRunewick"); -- That's all folks

   -- Quest 205 (Runewick Treasury, NPC Neiran el Nyarale)

    if (donated) and (User:getQuestProgress(205) == 1) then
		User:setQuestProgress(205, 2); --Quest solved!
		common.InformNLS(User,"[Queststatus] Du hast erfolgreich die Aufgabe von Neiran el Nyarale aufgeführt. Sprich mit ihm, um deine Belohnung einzufordern.","[Quest status] You successfully completet the task given by Neiran el Nyarale. Talk to him to claim your reward."); --sending a message
	end

	-- Quest end

end

return M

