-- UPDATE common SET com_script='item.id_361_altar' WHERE com_itemid IN (361);

require("base.common")
require("content.gods")

module("item.id_361_altar", package.seeall, package.seeall(content.gods))

function LookAtItem(User, Item)

	if Item.data ==100 then --used for THE LIBRARY quest
		if (User:getPlayerLanguage() ==0) then
			User:inform("Dir fallen die Buchstaben CRG am Altar auf")
			else
			User:inform("You notice the letters CRG on the altar")
		end
	end
	
    if Item.data > 0 then
        if User:getPlayerLanguage() == 0 then
            ret = "Altar "..GOD_DE[Item.data];
        else
            ret = "Altar "..GOD_EN[Item.data];
        end;
        if User:getRace() == 5 then
            ret = string.gsub( ret, "Tanora", "Zshhel-pheey-arrr" );
        end;
    else
        ret = User:getPlayerLanguage() == 0 and "Ungeweihter Altar" or "Undedicated altar";
    end;
    world:itemInform( User, Item, ret );
end

function UseItem(User, SourceItem, TargetItem, Counter, param)

	if (SourceItem.data == 100) then --used for THE LIBRARY quest
		
		local items = User:getItemList(79);
				for i, item in pairs(items) do
					if (item.data == 705) or (item.data==707) then --teleport if has complete amulet
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
 

