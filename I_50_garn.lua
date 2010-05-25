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
				end;
		end;
end;