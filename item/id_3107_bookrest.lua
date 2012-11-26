-- UPDATE common SET com_script='item.id_3107_bookrest' WHERE com_itemid = 3107;

module("item.id_3107_bookrest", package.seeall)

function LookAtItem(User, Item) -- Used for THE LIBRARY QUEST

	if Item.data ==100 then --used for THE LIBRARY quest -- ruby bonus
		if (User:getPlayerLanguage() ==0) then
			User:inform("Du vermagst, eine Belohnung zur erlangen - ein magischer Rubin liegt in dem Buch.")
			else
			User:inform("You may obtain one reward - a magical ruby lies inside this book.")
		end
	end

	if Item.data ==101 then --used for THE LIBRARY quest -- obsidian bonus
		if (User:getPlayerLanguage() ==0) then
			User:inform("Du vermagst, eine Belohnung zur erlangen - ein magischer Schwarzstein liegt in dem Buch.")
			else
			User:inform("You may obtain one reward - a magical obsidian lies inside this book.")
		end
	end
	
	if Item.data ==102 then --used for THE LIBRARY quest -- diamond bonus
		if (User:getPlayerLanguage() ==0) then
			User:inform("Du vermagst, eine Belohnung zur erlangen - ein magischer Diamant liegt in dem Buch.")
			else
			User:inform("You may obtain one reward - a magical diamond lies inside this book.")
		end
	end
	
end

function UseItem(User,SourceItem)

	if (SourceItem.data ==100) or (SourceItem.data==101) or (SourceItem.data==102) then
	
		local found = 0;
	
		local items = User:getItemList(79);
				for i, item in pairs(items) do
					if (item.data == 705) then --if he has 705, give the ruby and change the item
							world:erase(item, item.number)
							if (User:getPlayerLanguage() ==0) then
								User:inform("Nachdem du den Stein an dich genommen hast, bemerkst du, wie das Amulet seinen Glanz verliert.");
							else
								User:inform("As you take the gem out, you notice the amulet seems to have lost its shine.");
							end
							User:createItem(79,1,333,707)
							found = 1
							if (SourceItem.data==100) then --l2 ruby
							User:createItem(46,1,333,2)
							elseif (SourceItem.data==101) then --l2 obsidian
							User:createItem(283,1,333,2)
							elseif (SourceItem.data==102) then --l2 diamond
							User:createItem(285,1,333,2)
							end
						break;
					end;
				end;
				
	end;
	
end; -- end function
