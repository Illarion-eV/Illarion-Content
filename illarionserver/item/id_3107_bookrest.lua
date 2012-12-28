-- UPDATE common SET com_script='item.id_3107_bookrest' WHERE com_itemid = 3107;

module("item.id_3107_bookrest", package.seeall)

function LookAtItem(User, Item) -- Used for THE LIBRARY QUEST

	if tonumber(Item:getData("libraryQuest")) ==100 then --used for THE LIBRARY quest -- ruby bonus
		if (User:getPlayerLanguage() ==0) then
			User:inform("Du vermagst, eine Belohnung zur erlangen - ein magischer Rubin liegt in dem Buch.")
			else
			User:inform("You may obtain one reward - a magical ruby lies inside this book.")
		end
	end

	if tonumber(Item:getData("libraryQuest")) ==101 then --used for THE LIBRARY quest -- obsidian bonus
		if (User:getPlayerLanguage() ==0) then
			User:inform("Du vermagst, eine Belohnung zur erlangen - ein magischer Obsidian liegt in dem Buch.")
			else
			User:inform("You may obtain one reward - a magical obsidian lies inside this book.")
		end
	end
	
	if tonumber(Item:getData("libraryQuest")) ==102 then --used for THE LIBRARY quest -- diamond bonus
		if (User:getPlayerLanguage() ==0) then
			User:inform("Du vermagst, eine Belohnung zur erlangen - ein magischer Diamant liegt in dem Buch.")
			else
			User:inform("You may obtain one reward - a magical diamond lies inside this book.")
		end
	end
	
end

function UseItem(User,SourceItem)

	if (tonumber(SourceItem:getData("libraryQuest")) ==100) or (tonumber(SourceItem:getData("libraryQuest"))==101) or (tonumber(SourceItem:getData("libraryQuest"))==102) then
	
		local found = 0;
	
		local items = User:getItemList(79);
				for i, item in pairs(items) do
					if (tonumber(item:getData("libraryQuest")) == 705) then --if he has 705, give the ruby and change the item
							world:erase(item, item.number)
							if (User:getPlayerLanguage() ==0) then
								User:inform("Nachdem du den Stein an dich genommen hast, bemerkst du, wie das Amulet seinen Glanz verliert.");
							else
								User:inform("As you take the gem out, you notice the amulet seems to have lost its shine.");
							end
							User:createItem(79,1,333,707)
							found = 1
							if (tonumber(SourceItem:getData("libraryQuest"))==100) then --l2 ruby
							User:createItem(46,1,333,2)
							elseif (tonumber(SourceItem:getData("libraryQuest"))==101) then --l2 obsidian
							User:createItem(283,1,333,2)
							elseif (tonumber(SourceItem:getData("libraryQuest"))==102) then --l2 diamond
							User:createItem(285,1,333,2)
							end
						break;
					end;
				end;
				
	end;
	
end; -- end function
