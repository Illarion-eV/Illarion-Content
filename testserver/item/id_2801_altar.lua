-- UPDATE common SET com_script='item.id_2801_altar' WHERE com_itemid = 2801;

module("item.id_2801_altar", package.seeall)

function LookAtItem(User,Item)
if (tonumber(Item:getData("libraryQuest"))==701) then
	if (User:getPlayerLanguage() == 0) then
            world:itemInform(User,Item,"Merkwürdige Konstruktion in deren Mitte ein Loch gemeißelt wurde. 'Das Schloss' ist darunter eingemeißelt.");
        else
            world:itemInform(User,Item,"strange construction with a hole carved in the middle. 'The Lock' is carved underneath");
        end
end;

--for library quest

if (tonumber(Item:getData("libraryQuest"))~=701) then
	if (User:getPlayerLanguage() == 0) then
            world:itemInform(User,Item,"Altar");
        else
            world:itemInform(User,Item,"altar");
        end
end;

end; --end function
	

function UseItem(User,SourceItem,TargetItem,lstate)

-- part of the Library Quest

if (tonumber(SourceItem:getData("libraryQuest"))==701) then
--check whether full amulet is present
	local items = User:getItemList(79);
				for i, item in pairs(items) do
					if (tonumber(item:getData("libraryQuest")) == 705) then --full amulet
							if (User:getPlayerLanguage() ==0) then
								User:inform("Das Amulett passt ins Loch. Du spürst eine schnelle Bewegung.");
							else
								User:inform("The amulet fits in the hole. You feel rapid motion");
							end
						User:warp(posStruct(0,0,0))
						break;
					end;
				end;
end;

end; --function
	
