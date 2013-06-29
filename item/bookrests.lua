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


ferrySourceItemPos={position(101,790,0), position(105,833,0),position(616,859,0),position(726,809,0),position(888,485,0),position(870,285,0),position(987,257,0),position(451,95,0), position(364,49,0),position(415,85,0),position(478,34,0)}

ferryDE={}
ferryEN={}
ferryDE[1]={"Cadomyr Hafen","Cadomyr Verlorener Hafen","Einsame Inseln","Runewick Hafen","Ostland Hafen","Nördlicher Hafen"}
ferryEN[1]={"Cadomyr Harbour","Cadomyr Lost Harbour","Lonely Islands","Runewick Harbour","Eastland Harbour","Northern Harbour"}
ferryDE[7]={"Cadomyr Hafen","Cadomyr Verlorener Hafen","Einsame Inseln","Runewick Hafen","Ostland Hafen","Nördlicher Hafen","Böser Fels"}
ferryEN[7]={"Cadomyr Harbour","Cadomyr Lost Harbour","Lonely Islands","Runewick Harbour","Eastland Harbour","Northern Harbour","Evilrock"}
ferryDE[8]={"Galmair Hafen","Nördliche Inseln Ra","Nördliche Inseln Hept","Nördliche Inseln Yeg"}
ferryEN[8]={"Galmair Harbour","Northern Islands Ra","Northern Islands Hept","Northern Islands Yeg"}

ferryItem={}
ferryItem[1]={2701,229,229,105,229,229}
ferryItem[7]={2701,229,229,105,229,229,229}
ferryItem[8]={61,229,229,299}

ferryTargetPos={}
ferryTargetPos[1]={position(101,790,0), position(105,833,0),position(616,859,0),position(726,809,0),position(888,485,0),position(870,285,0)}
ferryTargetPos[7]={position(101,790,0), position(105,833,0),position(616,859,0),position(726,809,0),position(888,485,0),position(870,285,0),position(987,257,0)}
ferryTargetPos[8]={position(451,95,0), position(364,49,0),position(415,85,0),position(478,34,0)}

function Ferry(User, SourceItem)

    local names
	if  User:getPlayerLanguage() == Player.german then
		names = ferryDE[7]
	else
		names = ferryEN[7]
	end
	local items = ferryItem[7]
	local targetPos = ferryTargetPos[7]
	
	local callback = function(dialog)
	
		success = dialog:getSuccess()
		if success then
			selected = dialog:getSelectedIndex()
			if  base.money.CharHasMoney(User,10000) then
				
				if (targetPos[selected+1].x - SourceItem.pos.x) * (targetPos[selected+1].x - SourceItem.pos.x) < 10 then
					User:inform("Ihr befindet euch bereits in " ..names[selected+1]..".", "You are already in "..names[selected+1]..".")
				else
				
					User:inform("Ihr habt euch dazu entschlossen nach " ..names[selected+1].. " zu Reisen.", "You have chosen to travel to " ..names[selected+1]..".")
					base.money.TakeMoneyFromChar(User,10000)
					world:gfx(1,User.pos)
					world:makeSound(9,User.pos);
						
					handler.warpgroup.warpGroup(position(870,286,0),5, position(451,95,0), 42 )	
--					User:warp(targetPos[selected+1])
					world:gfx(11,User.pos)
					world:makeSound(9,User.pos);
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
