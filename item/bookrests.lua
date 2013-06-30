require("base.common")
require("handler.warpgroup");

-- UPDATE common SET com_script='item.bookrests' WHERE com_itemid = 3104;
-- UPDATE common SET com_script='item.bookrests' WHERE com_itemid = 3105;
-- UPDATE common SET com_script='item.bookrests' WHERE com_itemid = 3106;
-- UPDATE common SET com_script='item.bookrests' WHERE com_itemid = 3107;
-- UPDATE common SET com_script='item.bookrests' WHERE com_itemid = 3108;

module("item.bookrests", package.seeall)

function LookAtItem(User,Item)
	
	local lookAt 
	-- Bookrest for the Salavesh dungeon!
	if (Item.pos == position(741,406,-3)) then
		lookAt = SalaveshLookAt(User, Item)
	end
	-- Salavesh end
	
	-- ferries
	local Amountferry = table.getn(ferrySourceItemPos)	
	for i = 1,Amountferry do	
		if (Item.pos == ferrySourceItemPos[i]) then
			lookAt = FerryLookAt(User, Item)
		end
	end
	-- ferries end

	-- static teleporter
	if Item:getData("staticTeleporter") ~= "" then
		lookAt = StaticTeleporterLookAt(User, Item)
	end
	-- teleporter end
	
	if lookAt then
	    world:itemInform(User, Item, lookAt)
	else
	    world:itemInform(User, Item, base.lookat.GenerateLookAt(User, Item, 0))
	end	
end


function FerryLookAt(User, Item)
	local lookAt = ItemLookAt();
--	lookAt.rareness = ItemLookAt.rareItem;
	if (User:getPlayerLanguage()==0) then
		lookAt.name = "Fähre";
		lookAt.description = "Wer mit möchte, sollte sich schnellsten auf dem Steg einfinden."
	else
		lookAt.name = "Ferry";
		lookAt.description = "Anyone who likes to join should gather on the jetty."
	end
	return lookAt
end

function StaticTeleporterLookAt(User, Item)
	
	local lookAt = ItemLookAt();
	lookAt.name = "Teleporter";
	return lookAt
end

function SalaveshLookAt(User, Item)
    
	local lookAt = ItemLookAt();
	lookAt.rareness = ItemLookAt.rareItem;
		
	if (User:getPlayerLanguage()==0) then
		lookAt.name = "Tagebuch des Abtes Elzechiel";
		lookAt.description = "Dieses Buch ist von einer schaurigen Schönheit. Du bist versucht, es dennoch zu lesen..."
	else
		lookAt.name = "Journal of Abbot Elzechiel";
		lookAt.description = "This item has an evil presence. You are tempted to read it, though..."
	end
	return lookAt
end

function UseItem(User, SourceItem)
	-- Bookrest for the Salavesh dungeon!
	if (SourceItem.pos == position(741,406,-3)) then
	    User:sendBook(201);
	end
	-- Salavesh end

	-- ferries
	local Amountferry = table.getn(ferrySourceItemPos)	
	for i = 1,Amountferry do
		if (SourceItem.pos == ferrySourceItemPos[i]) then
			Ferry(User, SourceItem)
		end	
	end
	-- ferries end
	
	-- static teleporter
	if SourceItem:getData("staticTeleporter") ~= "" then
	    StaticTeleporter(User, SourceItem)
	end
	-- static teleporter end
end

function StaticTeleporter(User, SourceItem)

    local names
	if  User:getPlayerLanguage() == Player.german then
		names = {"Runewick","Galmair","Cadomyr","Hanfschlinge"}
	else
		names = {"Runewick","Galmair","Cadomyr","Necktie"}
	end
	local items = {105,61,2701,1909}
	local targetPos = {position(836,813,0), position(424,245,0),position(127,647,0),position(684,307,0)}
	
	local callback = function(dialog)
	
		success = dialog:getSuccess()
		if success then
			selected = dialog:getSelectedIndex()
			if  base.money.CharHasMoney(User,1000) then
				
				if (targetPos[selected+1].x - SourceItem.pos.x) * (targetPos[selected+1].x - SourceItem.pos.x) < 10 then
					User:inform("Ihr befindet euch bereits in " ..names[selected+1]..".", "You are already in "..names[selected+1]..".")
				else
				
					User:inform("Ihr habt euch dazu entschlossen nach " ..names[selected+1].. " zu Reisen.", "You have chosen to travel to " ..names[selected+1]..".")
					base.money.TakeMoneyFromChar(User,1000)
					world:gfx(45,User.pos)
					world:makeSound(13,User.pos);
						
						
					User:warp(targetPos[selected+1])
					world:gfx(46,User.pos)
					world:makeSound(4,User.pos);
				end
			else
				User:inform("Ihr habt nicht genug Geld für diese Reise. Die Reise kostet zehn Silberstücke.", "You don't have enough money for this journey. The journey costs ten silver coins.")
			end
		
		end
	end
		
	local dialog
	if User:getPlayerLanguage() == Player.german then
		dialog = SelectionDialog("Teleporter", "Eine Reise kostet zehn Silberstücke. Wähle eine Ziel aus.", callback)
	else
		dialog = SelectionDialog("Teleporter", "A journey costs ten silver coins. Choose a destination.", callback)
	end
	dialog:setCloseOnMove()
	
	for i=1,#items do
		dialog:addOption(items[i], names[i])
	end
	User:requestSelectionDialog(dialog)
end


ferrySourceItemPos={position(101,790,0), position(105,833,0),position(616,859,0),position(727,809,0),position(888,485,0),position(870,285,0),position(987,257,0),position(451,95,0), position(364,49,0),position(415,85,0),position(478,34,0)}

ferryDE={}
ferryEN={}
ferryDE[1]={"Cadomyr Hafen","Cadomyr Verlorener Hafen","Einsame Inseln","Runewick Hafen","Ostland Hafen","Nördlicher Hafen"}
ferryEN[1]={"Cadomyr Harbour","Cadomyr Lost Harbour","Lonely Islands","Runewick Harbour","Eastland Harbour","Northern Harbour"}
ferryDE[2]={"Cadomyr Hafen","Cadomyr Verlorener Hafen","Runewick Hafen"}
ferryEN[2]={"Cadomyr Harbour","Cadomyr Lost Harbour","Runewick Harbour"}
ferryDE[3]={"Cadomyr Hafen","Einsame Inseln","Runewick Hafen"}
ferryEN[3]={"Cadomyr Harbour","Lonely Islands","Runewick Harbour"}
ferryDE[4]={"Cadomyr Hafen","Cadomyr Verlorener Hafen","Einsame Inseln","Runewick Hafen","Ostland Hafen","Nördlicher Hafen"}
ferryEN[4]={"Cadomyr Harbour","Cadomyr Lost Harbour","Lonely Islands","Runewick Harbour","Eastland Harbour","Northern Harbour"}
ferryDE[5]={"Cadomyr Hafen","Runewick Hafen","Ostland Hafen","Nördlicher Hafen"}
ferryEN[5]={"Cadomyr Harbour","Runewick Harbour","Eastland Harbour","Northern Harbour"}
ferryDE[6]={"Cadomyr Hafen","Runewick Hafen","Ostland Hafen","Nördlicher Hafen","Böser Fels"}
ferryEN[6]={"Cadomyr Harbour","Runewick Harbour","Eastland Harbour","Northern Harbour","Evilrock"}
ferryDE[7]={"Nördlicher Hafen","Böser Fels"}
ferryEN[7]={"Northern Harbour","Evilrock"}
ferryDE[8]={"Galmair Hafen","Nördliche Inseln Ra","Nördliche Inseln Hept","Nördliche Inseln Yeg"}
ferryEN[8]={"Galmair Harbour","Northern Islands Ra","Northern Islands Hept","Northern Islands Yeg"}
ferryDE[9]={"Galmair Hafen","Nördliche Inseln Ra","Nördliche Inseln Hept","Nördliche Inseln Yeg"}
ferryEN[9]={"Galmair Harbour","Northern Islands Ra","Northern Islands Hept","Northern Islands Yeg"}
ferryDE[10]={"Galmair Hafen","Nördliche Inseln Ra","Nördliche Inseln Hept","Nördliche Inseln Yeg"}
ferryEN[10]={"Galmair Harbour","Northern Islands Ra","Northern Islands Hept","Northern Islands Yeg"}
ferryDE[11]={"Galmair Hafen","Nördliche Inseln Ra","Nördliche Inseln Hept","Nördliche Inseln Yeg"}
ferryEN[11]={"Galmair Harbour","Northern Islands Ra","Northern Islands Hept","Northern Islands Yeg"}

ferryItem={}
ferryItem[1]={2701,272,3099,105,2760,308}
ferryItem[2]={2701,272,105}
ferryItem[3]={2701,3099,105}
ferryItem[4]={2701,272,3099,105,2760,308}
ferryItem[5]={2701,105,2760,308}
ferryItem[6]={2701,105,2760,308,915}
ferryItem[7]={308,915}
ferryItem[8]={61,359,360,372}
ferryItem[9]={61,359,360,372}
ferryItem[10]={61,359,360,372}
ferryItem[11]={61,359,360,372}

ferryTargetPos={}
ferryTargetPos[1]={position(101,790,0), position(105,833,0),position(616,859,0),position(727,809,0),position(888,485,0),position(870,285,0)}
ferryTargetPos[2]={position(101,790,0), position(105,833,0),position(727,809,0)}
ferryTargetPos[3]={position(101,790,0), position(616,859,0),position(727,809,0)}
ferryTargetPos[4]={position(101,790,0), position(105,833,0),position(616,859,0),position(727,809,0),position(888,485,0),position(870,285,0)}
ferryTargetPos[5]={position(101,790,0),position(727,809,0),position(888,485,0),position(870,285,0)}
ferryTargetPos[6]={position(101,790,0),position(727,809,0),position(888,485,0),position(870,285,0),position(987,257,0)}
ferryTargetPos[7]={position(870,285,0),position(987,257,0)}
ferryTargetPos[8]={position(451,95,0), position(364,49,0),position(415,85,0),position(478,34,0)}
ferryTargetPos[9]={position(451,95,0), position(364,49,0),position(415,85,0),position(478,34,0)}
ferryTargetPos[10]={position(451,95,0), position(364,49,0),position(415,85,0),position(478,34,0)}
ferryTargetPos[11]={position(451,95,0), position(364,49,0),position(415,85,0),position(478,34,0)}

function Ferry(User, SourceItem)

	local names
	local Amountferry = table.getn(ferrySourceItemPos)	
	for j = 1,Amountferry do
	   if (SourceItem.pos == ferrySourceItemPos[j]) then
		if  User:getPlayerLanguage() == Player.german then
			names = ferryDE[j]
		else
			names = ferryEN[j]
		end

		items = ferryItem[j]
		targetPos = ferryTargetPos[j]
           end
	end
--User:inform("names: "..names,"names: "..names)
--User:inform("items: "..items,"items: "..items)
--User:inform("targetPos: "..targetPos,"targetPos: "..targetPos)
	
	local callback = function(dialog)
	
		success = dialog:getSuccess()
		if success then
			selected = dialog:getSelectedIndex()
			if  base.money.CharHasMoney(User,10000) then
				
				if (targetPos[selected+1].x - SourceItem.pos.x) * (targetPos[selected+1].x - SourceItem.pos.x) < 10 then
					User:inform("Ihr befindet euch bereits in " ..names[selected+1]..".", "You are already in "..names[selected+1]..".")
				else
				

					base.money.TakeMoneyFromChar(User,10000)


					travler = world:getPlayersInRangeOf(SourceItem.pos, 5); 
					for i,player in ipairs(travler) do
						player:inform("Ihr habt euch dazu entschlossen nach " ..names[selected+1].. " zu Reisen.", "You have chosen to travel to " ..names[selected+1]..".")
						world:gfx(1,player.pos)
						world:makeSound(9,player.pos);
						player:warp(targetPos[selected+1])
						world:gfx(11,player.pos)
						world:makeSound(9,player.pos);	
					end

						
--					handler.warpgroup.warpGroup(SourceItem.pos, 5, position(1,1,0), 42 )	
--					User:warp(targetPos[selected+1])
--					world:gfx(11,User.pos)
--					world:makeSound(9,User.pos);
				end
			else
				User:inform("Ihr habt nicht genug Geld für diese Reise. Die Reise kostet ein Goldstück für eine Überfahrt.", "You don't have enough money for this journey. The journey costs one gold coin for one passage.")
			end
		
		end
	end
		
	local dialog
	if User:getPlayerLanguage() == Player.german then
		dialog = SelectionDialog("Fähre", "Eine Reise kostet ein Goldstück für die ganze Gruppe. Wähle eine Ziel aus.", callback)
	else
		dialog = SelectionDialog("Ferry", "A journey costs one gold coin for the group. Choose a destination.", callback)
	end
	dialog:setCloseOnMove()
	
	for i=1,#items do
		dialog:addOption(items[i], names[i])
	end
	User:requestSelectionDialog(dialog)
end
