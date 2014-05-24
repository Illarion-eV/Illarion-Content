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
-- UPDATE common SET com_script='item.id_2937_skeleton' WHERE com_itemid = 2937;
--Quest 112: The Ghost Oak, NPC Madoquar
--Quest 522: Gorgophone's Nest

require("base.common")
require("base.lookat")

module("item.id_2937_skeleton", package.seeall)

function LookAtItem(User,Item)

	if Item.pos == position (501,156,0) then --The body of Madoquar
	    base.lookat.SetSpecialDescription(Item,"Ein zierliches Skelett, vielleicht von einer Elfin.","A slender skeleton, maybe an elfess."); --sending the message
	elseif Item.pos == position (900,453,-6) then -- drow body in spider dungeon
	    base.lookat.SetSpecialDescription(Item,"Skelett eines Drow","skeleton of a drow");
	else
		base.lookat.SetSpecialName(Item,"Verrottendes Skelett","rotting skeleton"); --default
    end
	world:itemInform(User,Item,base.lookat.GenerateLookAt(User, Item, base.lookat.NONE));
end

function UseItem(User, SourceItem, ltstate)

	if SourceItem.pos == position (501,156,0) and User:getQuestProgress(112) == 6 then --The body of Madoquar
	    User:setQuestProgress(112,7); --Bone found!
		base.common.InformNLS(User,"[Quest status] Bei der Untersuchung der Leiche findest du einen Knochen. Madoquar sollte damit zufrieden sein.","[Quest status] While examining the skeleton, you find a bone. Madoquar should be satisfied with it."); --sending the message
	elseif SourceItem.pos == position (900,453,-6) then -- drow body in spider dungeon
		local queststatus = User:getQuestProgress(522); -- here, we save which events were triggered
		local queststatuslist = {};
		queststatuslist = base.common.Split_number(queststatus, 6); -- reading the digits of the queststatus as table
		if queststatuslist[1] == 0 then -- sword, only triggered once by each char
			base.common.InformNLS(User, "Du findest ein Schwert bei der Leiche des Drow.", "You discover a sword by the corpse of the drow.");
			local notCreated = User:createItem(3035, 1, 801, nil ); -- create the item
			if ( notCreated > 0 ) then -- too many items -> character can't carry anymore
				world:createItemFromId(3035, notCreated, User.pos, true, 801, nil );
				base.common.HighInformNLS(User,
					"Du kannst nichts mehr tragen.",
					"You can't carry any more.");
			end
			queststatuslist[1] = 1;
            User:setQuestProgress(522, queststatuslist[1]*100000+queststatuslist[2]*10000+queststatuslist[3]*1000+queststatuslist[4]*100+queststatuslist[5]*10+queststatuslist[6]*1); --saving the new queststatus
		end
	else
		base.common.InformNLS(User,"Dir ist gerade nicht nach Grabschädung und Totenentweihung.","You don't feel like grave desecration and body defilement right now."); --default
    end

end
