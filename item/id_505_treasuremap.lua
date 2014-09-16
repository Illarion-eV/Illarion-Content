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
require("base.common")
require("base.treasure")
require("base.lookat")

-- UPDATE items SET itm_script='item.id_505_treasuremap' WHERE itm_id IN (505);

module("item.id_505_treasuremap", package.seeall)

function LookAtItem(User, Item)
	if Item:getData("MapPosX") == "" and Item:getData("MapPosY") == "" and Item:getData("MapPosZ") == "" then --no valid treasure map
		base.lookat.SetSpecialDescription(Item, "Eine Stück Pergament mit ein paar Strichen. Es sieht eher nach einer Kinderzeichnung statt einer Schatzkarte aus.",
            "A piece of parchment with some lines on it. It rather looks like a childrens drawing instead of a treasure map." );
		return base.lookat.GenerateLookAt(User, Item, base.lookat.NONE)
	else
		local dir = base.treasure.getDirection( User, Item );
		local distance = base.treasure.getDistance (User, Item );
		local TreasureName = base.treasure.GetTreasureName(math.max(1,math.floor(Item.quality/100)), User:getPlayerLanguage(), not dir );

		if not dir then
			base.lookat.SetSpecialDescription(Item, "Eine Karte mit einer Markierung auf einer Position irgendwo in deiner unmittelbaren Nähe. Du vermutest, dass es sich um "..TreasureName.." handelt.",
				"A map that shows a position somewhere really close to your current position. You think it could be "..TreasureName.."." );
			return base.lookat.GenerateLookAt(User, Item, base.lookat.NONE)
		elseif string.find(dir,"wrong")~=nil then
			base.lookat.SetSpecialDescription(Item,
				"Du scheinst dich nicht im richtigen Gebiet aufzuhalten.",
				"You don't seem to be in the correct area.");
			return base.lookat.GenerateLookAt(User, Item, base.lookat.NONE)
		else
			base.lookat.SetSpecialDescription(Item,
				"Eine Karte mit einer Markierung, die sich wahrscheinlich von dir aus gesehen "..distance.." im "..dir.." befindet. Du vermutest, dass es sich um "..TreasureName.." handelt.",
				"A map that shows a mark that is probably located somewhere "..distance.." in the "..dir.." of your current position. You believe the map leads to "..TreasureName.."." );
			return base.lookat.GenerateLookAt(User, Item, base.lookat.NONE)
		end;
	end;
end;

function UseItem(User, SourceItem, ltstate)  -- DONT EDIT THIS LINE!

end
