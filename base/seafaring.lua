require("base.common")
--require("item.bookrests")

module("base.seafaring", package.seeall)





ferrySourceItemPos={position(101,790,0),position(727,809,0),position(888,485,0),position(870,285,0),position(451,95,0)}

ferryDE={}
ferryEN={}
ferryDE[1]={"Cadomyr Hafen","Cadomyr Verlorener Hafen","Leuchtturm","Einsame Inseln","Runewick Hafen","Ostland Hafen","Nördlicher Hafen"}
ferryEN[1]={"Cadomyr Harbour","Cadomyr Lost Harbour","Lighthouse","Lonely Islands","Runewick Harbour","Eastland Harbour","Northern Harbour"}
ferryDE[2]={"Cadomyr Hafen","Cadomyr Verlorener Hafen","Leuchtturm","Einsame Inseln","Runewick Hafen","Ostland Hafen","Nördlicher Hafen"}
ferryEN[2]={"Cadomyr Harbour","Cadomyr Lost Harbour","Lighthouse","Lonely Islands","Runewick Harbour","Eastland Harbour","Northern Harbour"}
ferryDE[3]={"Cadomyr Hafen","Runewick Hafen","Ostland Hafen","Nördlicher Hafen"}
ferryEN[3]={"Cadomyr Harbour","Runewick Harbour","Eastland Harbour","Northern Harbour"}
ferryDE[4]={"Cadomyr Hafen","Runewick Hafen","Ostland Hafen","Nördlicher Hafen","Böser Fels"}
ferryEN[4]={"Cadomyr Harbour","Runewick Harbour","Eastland Harbour","Northern Harbour","Evilrock"}
ferryDE[5]={"Galmair Hafen","Nördliche Inseln -  Ra","Nördliche Inseln -  Hept","Nördliche Inseln -  Yeg","Unüberwindbarer Limes"}
ferryEN[5]={"Galmair Harbour","Northern Islands -  Ra","Northern Islands -  Hept","Northern Islands -  Yeg","Insurmountable Limes"}


ferryItem={}
ferryItem[1]={2701,272,467,3099,105,2760,308}
ferryItem[2]={2701,272,467,3099,105,2760,308}
ferryItem[3]={2701,105,2760,308}
ferryItem[4]={2701,105,2760,308,915}
ferryItem[5]={61,359,360,372,474}

ferryTargetPos={}
ferryTargetPos[1]={position(102,790,0),position(105,832,0),position(553,658,0),position(616,859,0),position(728,809,0),position(888,486,0),position(870,286,0)}
ferryTargetPos[2]={position(102,790,0),position(105,832,0),position(553,658,0),position(616,859,0),position(728,809,0),position(888,486,0),position(870,286,0)}
ferryTargetPos[3]={position(102,790,0),position(728,809,0),position(888,486,0),position(870,286,0)}
ferryTargetPos[4]={position(102,790,0),position(728,809,0),position(888,486,0),position(870,286,0),position(987,256,0)}
ferryTargetPos[5]={position(450,95,0),position(364,49,0),position(415,85,0),position(478,34,0),position(682,45,0)}


pirateOptionsDE={"Kämpfe","Flieh","Zahl"}
pirateOptionsEN={"Fight","Flee","Pay"}

pirateItem={1,53,61}


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
					User:inform("Du befindest dich bereits in " ..names[selected+1]..".", "You are already in "..names[selected+1]..".")
				else
				

					base.money.TakeMoneyFromChar(User,10000)
					travler = world:getPlayersInRangeOf(SourceItem.pos, 5); 
					if math.random(1,100)< 91 then

						piratesAttack(User,SourceItem,travler)


 					else


					for i,player in ipairs(travler) do
						player:inform("Du hast dich dazu entschlossen nach " ..names[selected+1].. " zu Reisen.", "You have chosen to travel to " ..names[selected+1]..".")
						world:gfx(1,player.pos)
						world:makeSound(9,player.pos);
						player:warp(targetPos[selected+1])
						world:gfx(11,player.pos)
						world:makeSound(9,player.pos);	
					end
					end
						
--					handler.warpgroup.warpGroup(SourceItem.pos, 5, position(1,1,0), 42 )	
--					User:warp(targetPos[selected+1])
--					world:gfx(11,User.pos)
--					world:makeSound(9,User.pos);
				end
			else
				User:inform("Du hast nicht genug Geld für diese Reise. Die Reise kostet ein Goldstück für eine Überfahrt.", "You don't have enough money for this journey. The journey costs one gold coin for one passage.")
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








function piratesAttack(User,SourceItem,travler)
	--[[for i,player in ipairs(travler) do
		player:inform("Piraten nähern sich eurem Schiff, dir stehen folgende Möglichkeiten zur Wahl.", "Pirates are coming closer to your ship. You can choose between following options.")
		world:gfx(1,player.pos)
		world:makeSound(9,player.pos);
		player:warp(position(352,870,1))
		world:gfx(11,player.pos)
		world:makeSound(9,player.pos);	
	end]]

	local options
	local Amountoptions = table.getn(pirateOptionsDE)	
	for j = 1,Amountoptions do
	   	if  User:getPlayerLanguage() == Player.german then
			pirateOptions = pirateOptionsDE
		else
			pirateOptions = pirateOptionsEN
		end
	end


	local callback = function(dialog)
	debug("..selected ")
		success = dialog:getSuccess() 
		if success then
			selected = dialog:getSelectedIndex() 
			User:inform("Success, you selected option "..selected+1) 
		else
			User:inform("Selection aborted!") 
		end
	debug("..selected2 ")
	end
--	debug("..selected ")
	local dialog
	if User:getPlayerLanguage() == Player.german then
		dialog = SelectionDialog("Piraten Angriff", "Piraten nähern sich eurem Schiff, dir stehen folgende Möglichkeiten zur Wahl.", callback)
	else
		dialog = SelectionDialog("Pirates attack", "Pirates are coming closer to your ship. You can choose between following options.", callback)
	end
	dialog:setCloseOnMove()
	
	for i=1,Amountoptions do
		dialog:addOption(pirateItem[i],pirateOptions[i])
	end
	User:requestSelectionDialog(dialog)
end
