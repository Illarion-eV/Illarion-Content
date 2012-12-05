--For the 'The Library' quest - Llama

-- UPDATE common SET com_script='item.id_79_amethystamulet' WHERE com_itemid = 79;

module("item.id_79_amethystamulet", package.seeall)

function LookAtItem(User,Item)
if (Item.data == 701) then
  if (User:getPlayerLanguage() == 0) then
            world:itemInform(User,Item,"Zerbrochenes Amulettstück mit dem Buchstaben C als Inschrift, zwei weitere Teilstücke scheinen zu fehlen");
        else
            world:itemInform(User,Item,"broken amulet with the letter C on it, two other parts seem to be missing");
        end
	end
		-- Cad amulet
	if (Item.data ==702) then
	if (User:getPlayerLanguage() ==0) then
			world: itemInform(User,Item,"Zerbrochenes Amulettstück mit dem Buchstaben R als Inschrift, zwei weitere Teilstücke scheinen zu fehlen");
		else
			world:itemInform(User,Item,"broken Amulet with the letter R on it, two other parts seem to be missing");
		end
end
		-- Rune amulet
	if (Item.data == 703) then
	if (User:getPlayerLanguage() ==0) then
			world: itemInform(User,Item,"Ein zerbrochenes Amulettstück mit dem Buchstaben G als Inschrift, zwei weitere Teilstücke scheinen zu fehlen");
		else
			world:itemInform(User,Item,"broken amulet with the letter G on it, two other parts seem to be missing");
		end
	end
		-- Gal amulet
 if (Item.data == 712) then
	if (User:getPlayerLanguage() ==0) then
			world: itemInform(User,Item,"Zerbrochenes Amulettstück mit den Buchstaben CR als Inschrift, ein weiteres Teilstück scheint zu fehlen");
		else
			world:itemInform(User,Item,"broken amulet with the letters CR on it, one other part seems to be missing");
		end
	end
		-- CadRune amulet

 if (Item.data == 713) then
	if (User:getPlayerLanguage() ==0) then
			world: itemInform(User,Item,"Zerbrochenes Amulettstück mit den Buchstaben CG als Inschrift, ein weiteres Teilstück scheint zu fehlen");
		else
			world:itemInform(User,Item,"broken amulet with the letters CG on it, one other part seems to be missing");
		end
	end	-- CadGal amulet
		
 if (Item.data == 723) then
	if (User:getPlayerLanguage() ==0) then
			world: itemInform(User,Item,"Zerbrochenes Amulettstück mit den Buchstaben RG als Inschrift, ein weiteres Teilstück scheint zu fehlen");
		else
			world:itemInform(User,Item,"broken amulet with the letters RG on it, one other part seems to be missing");
		end
	end
		-- RuneGal amulet

 if (Item.data == 705) then
	if (User:getPlayerLanguage() ==0) then
			world: itemInform(User,Item,"Zerbrochenes Amulettstück mit den Buchstaben CRG als Inschrift. Es scheint nun wieder vollkommen zu sein.");
		else
			world:itemInform(User,Item,"amulet with the letters CRG on it. It seems to be whole now");
		end
		-- Complete amulet
	end



if (Item.data == 707) then
	if (User:getPlayerLanguage() ==0) then
			world: itemInform(User,Item,"Ein zerbrochenes Amulettstück mit den Buchstaben CRG als Inschrift. Es ist matt und wird nicht wieder strahlen");
		else
			world:itemInform(User,Item,"amulet with the letters CRG on it. It is dull and refuses to shine");
		end
		-- Complete amulet - after bonus was given
	end

end
	----------
		
function UseItem(User,SourceItem,TargetItem,counter,param,ltstate)
				
		--using 701
		
		if(SourceItem.data==701) then
			local items = User:getItemList(79);
				for i, item in pairs(items) do
					if (item.data == 702) then
						world:erase(item, item.number);
							if (User:getPlayerLanguage() ==0) then
								User:inform("Die zwei unterschiedlichen Teile des Amulettes verschmelzen");
							else
								User:inform("The two different parts of the amulet fuse");
							end
						User:createItem(79,1,333,712)
						world:erase(SourceItem,1)
						break;
					end;
					if (item.data == 703) then
						world:erase(item, item.number);
							if (User:getPlayerLanguage() ==0) then
								User:inform("Die zwei unterschiedlichen Teile des Amulettes verschmelzen");
							else
								User:inform("The two different parts of the amulet fuse");
							end
						User:createItem(79,1,333,713)
						world:erase(SourceItem,1)
						break;
					end;
				
					if (item.data == 723) then
						world:erase(item, item.number);
							if (User:getPlayerLanguage() ==0) then
								User:inform("Die zwei unterschiedlichen Teile des Amulettes verschmelzen");
							else
								User:inform("The two different parts of the amulet fuse");
							end
						User:createItem(79,1,333,705)
						world:erase(SourceItem,1)
						break;
					end;
				end;
		end;
		
		--using 702
		if(SourceItem.data==702) then
			local items = User:getItemList(79);
				for i, item in pairs(items) do
					if (item.data == 701) then
						world:erase(item, item.number);
							if (User:getPlayerLanguage() ==0) then
								User:inform("Die zwei unterschiedlichen Teile des Amulettes verschmelzen");
							else
								User:inform("The two different parts of the amulet fuse");
							end
						User:createItem(79,1,333,712)
						world:erase(SourceItem,1)
						break;
					end;
					if (item.data == 703) then
						world:erase(item, item.number);
							if (User:getPlayerLanguage() ==0) then
								User:inform("Die zwei unterschiedlichen Teile des Amulettes verschmelzen");
							else
								User:inform("The two different parts of the amulet fuse");
							end
						User:createItem(79,1,333,723)
						world:erase(SourceItem,1)
						break;
					end;
				
					if (item.data == 713) then
						world:erase(item, item.number);
							if (User:getPlayerLanguage() ==0) then
								User:inform("Die zwei unterschiedlichen Teile des Amulettes verschmelzen");
							else
								User:inform("The two different parts of the amulet fuse");
							end
						User:createItem(79,1,333,705)
						world:erase(SourceItem,1)
						break;
					end;
				end;
		
		
		end;
		
		--using 703
		if(SourceItem.data==703) then
			local items = User:getItemList(79);
				for i, item in pairs(items) do
					if (item.data == 701) then
						world:erase(item, item.number);
							if (User:getPlayerLanguage() ==0) then
								User:inform("Die zwei unterschiedlichen Teile des Amulettes verschmelzen");
							else
								User:inform("The two different parts of the amulet fuse");
							end
						User:createItem(79,1,333,713)
						world:erase(SourceItem,1)
						break;
					end;
					if (item.data == 702) then
						world:erase(item, item.number);
							if (User:getPlayerLanguage() ==0) then
								User:inform("Die zwei unterschiedlichen Teile des Amulettes verschmelzen");
							else
								User:inform("The two different parts of the amulet fuse");
							end
						User:createItem(79,1,333,723)
						world:erase(SourceItem,1)
						break;
					end;
				
					if (item.data == 712) then
						world:erase(item, item.number);
							if (User:getPlayerLanguage() ==0) then
								User:inform("Die zwei unterschiedlichen Teile des Amulettes verschmelzen");
							else
								User:inform("The two different parts of the amulet fuse");
							end
						User:createItem(79,1,333,705)
						world:erase(SourceItem,1)
						break;
					end;
				end;
		end;
		--end of '2 piece' amulets. Time for second stage ones
		--using 712
		if(SourceItem.data==712) then
			local items = User:getItemList(79);
				for i, item in pairs(items) do
					if (item.data == 703) then
						world:erase(item, item.number);
							if (User:getPlayerLanguage() ==0) then
								User:inform("Die zwei unterschiedlichen Teile des Amulettes verschmelzen");
							else
								User:inform("The two different parts of the amulet fuse");
							end
						User:createItem(79,1,333,705)
						world:erase(SourceItem,1)
						break;
					end;
				end;
		end;
		--using 713
		if(SourceItem.data==713) then
			local items = User:getItemList(79);
				for i, item in pairs(items) do
					if (item.data == 702) then
						world:erase(item, item.number);
							if (User:getPlayerLanguage() ==0) then
								User:inform("Die zwei unterschiedlichen Teile des Amulettes verschmelzen");
							else
								User:inform("The two different parts of the amulet fuse");
							end
						User:createItem(79,1,333,705)
						world:erase(SourceItem,1)
						break;
					end;
				end;
		end;
		--using 723
		if(SourceItem.data==723) then
			local items = User:getItemList(79);
				for i, item in pairs(items) do
					if (item.data == 701) then
						world:erase(item, item.number);
							if (User:getPlayerLanguage() ==0) then
								User:inform("Die zwei unterschiedlichen Teile des Amulettes verschmelzen");
							else
								User:inform("The two different parts of the amulet fuse");
							end
						User:createItem(79,1,333,705)
						world:erase(SourceItem,1)
						break;
					end;
				end;
		end;
		
		--using 705 (Complete)
		if(SourceItem.data == 705) then
			if (User:getPlayerLanguage() ==0) then
				User:inform("Auf einer kleinen Aufschrift ist zu lesen: 'Du hast den Schlüssel, nun finde das Schloss.'");
			else
				User:inform("A small inscription reads: 'You have the key, now find the lock'");
			end;
		
		end;
		
		
		
end;
