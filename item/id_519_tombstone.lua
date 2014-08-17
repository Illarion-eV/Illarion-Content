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
-- UPDATE items SET com_script='item.id_519_tombstone' WHERE com_itemid = 519;
--Quest 531: Akultut's chambers

require("base.common")
require("base.lookat")

module("item.id_519_tombstone", package.seeall)

function UseItem(User, SourceItem, ltstate)

	if SourceItem.pos == position (447,785,-9) then -- kindness tombstone in Akaltut's Chambers
		local queststatus = User:getQuestProgress(531); -- here, we save which events were triggered
		local queststatuslist = {};
		queststatuslist = base.common.Split_number(queststatus, 6); -- reading the digits of the queststatus as table
		if queststatuslist[1] == 0 then -- gem, only triggered once by each char
			base.common.InformNLS(User, "Du entdeckst einen glitzernden Edelstein bei der Leiche.", "You discover a shiny gem with the corpse.");
			local notCreated = User:createItem(198, 1, 333, {["gemLevel"] = 1}); -- create the item
			if ( notCreated > 0 ) then -- too many items -> character can't carry anymore
				world:createItemFromId(198, notCreated, User.pos, true, 333, {["gemLevel"] = 1});
				base.common.HighInformNLS(User,
					"Du kannst nichts mehr tragen.",
					"You can't carry any more.");
			end
			queststatuslist[1] = 1;
            User:setQuestProgress(531, queststatuslist[1]*100000+queststatuslist[2]*10000+queststatuslist[3]*1000+queststatuslist[4]*100+queststatuslist[5]*10+queststatuslist[6]*1); --saving the new queststatus
		end
    end

end
