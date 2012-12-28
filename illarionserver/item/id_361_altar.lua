-- UPDATE common SET com_script='item.id_361_altar' WHERE com_itemid IN (361);

require("base.common")
require("content.gods")

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

function UseItem(User, SourceItem, TargetItem, Counter, param)

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
 

