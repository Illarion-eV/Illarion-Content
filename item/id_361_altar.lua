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
-- UPDATE common SET com_script='item.id_361_altar' WHERE com_itemid IN (361);

require("base.common")
require("content.gods")
require("base.lookat")

module("item.id_361_altar", package.seeall, package.seeall(content.gods))

function LookAtItem(User, Item)

	if tonumber(Item:getData("libraryQuest")) ==100 then --used for THE LIBRARY quest
		if (User:getPlayerLanguage() ==0) then
			User:inform("Dir fallen die Buchstaben CRG am Altar auf")
			else
			User:inform("You notice the letters CRG on the altar")
		end
	end
	
    if tonumber(Item:getData("god")) > 0 then
        if User:getPlayerLanguage() == 0 then
            retDE = "Altar "..GOD_DE[tonumber(Item:getData("god"))];
        else
            retEN = "Altar "..GOD_EN[tonumber(Item:getData("god"))];
        end;
        if User:getRace() == 5 then
            retDE = string.gsub( retDE, "Tanora", "Zshhel-pheey-arrr" );
			retEN = string.gsub( retEN, "Tanora", "Zshhel-pheey-arrr" );
        end;
    else
        retDE = "Ungeweihter Altar";
		retEN = "Undedicated altar";
    end;
	base.lookat.SetSpecialName(Item, retDE, retEN)
	world:itemInform(User,Item,base.lookat.GenerateLookAt(User, Item, base.lookat.NONE));
end

function UseItem(User, SourceItem)

	if (tonumber(SourceItem:getData("libraryQuest")) == 100) then --used for THE LIBRARY quest
		
		local items = User:getItemList(79);
				for i, item in pairs(items) do
					if (tonumber(item:getData("libraryQuest")) == 705) or (tonumber(item:getData("libraryQuest"))==707) then --teleport if has complete amulet
							world:makeSound(5,position(385,552,0))
							User:warp(position(382,560,-3))
							if (User:getPlayerLanguage() ==0) then
								User:inform("Du legst das Amulett auf den Altar - Es blitzt auf und du bist an einem anderen Ort");
							else
								User:inform("You place the amulet on the altar - there is a flash and you are somewhere else");
							end
						break;
					end;
				end;
	end;
	

	

end;
 

