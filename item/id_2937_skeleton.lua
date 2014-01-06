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

require("base.common")
require("base.lookat")

module("item.id_2937_skeleton", package.seeall)

function LookAtItem(User,Item)

	if Item.pos == position (501,156,0) then --The body of Madoquar
	    base.lookat.SetSpecialDescription(Item,"Ein zierliches Skelett, vielleicht von einer Elfin.","A slender skeleton, maybe an elfess."); --sending the message
    else
		base.lookat.SetSpecialName(Item,"Verrottendes Skelett","rotting skeleton"); --default
    end
	world:itemInform(User,Item,base.lookat.GenerateLookAt(User, Item, base.lookat.NONE));
end

function UseItem(User, SourceItem, ltstate)

    queststatus=User:getQuestProgress(112);

	if SourceItem.pos == position (501,156,0) and queststatus == 6 then --The body of Madoquar
	    User:setQuestProgress(112,7); --Bone found!
		base.common.InformNLS(User,"[Quest status] Bei der Untersuchung der Leiche findest du einen Knochen. Madoquar sollte damit zufrieden sein.","[Quest status] While examining the skeleton, you find a bone. Madoquar should be satisfied with it."); --sending the message
    else
		base.common.InformNLS(User,"Dir ist gerade nicht nach Grabschädung und Totenentweihung.","You don't feel like grave desecration and body defilement right now."); --default
    end

end
